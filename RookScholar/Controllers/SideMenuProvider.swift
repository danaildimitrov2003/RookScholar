//
//  SideMenuProvider.swift
//  RookScholar
//
//  Created by Danail Dimitrov on 25.04.23.
//

import UIKit
import SwiftUI

protocol SideMenuDelegate: AnyObject {
    func sideMenuWidth() -> sideMenuWidth
    func sideMenuPosition() -> sideMenuPosition
    //func locations() -> [sideMenuLocation]
    
}

struct sideMenuLocation{
    var name:String
    var iconName:String
    var viewController:ViewController
    
}

class SideMenuProvider {
    
    
    let normalImage = UIImage(systemName: "line.3.horizontal")
    let pressedImage = UIImage(systemName: "xmark")
    var width = sideMenuWidth.small.rawValue
    var position = sideMenuPosition.right
    weak var delegate : SideMenuDelegate?
    
    
    var sideMenuHostingController : UIHostingController <SideMenuUIView>
    var isSideMenuSetUped = false
    
    weak var presenter : UINavigationController?
    
    
    init(presenter: UINavigationController? = nil) {
        self.sideMenuHostingController = UIHostingController <SideMenuUIView>(rootView: SideMenuUIView())
        self.presenter = presenter
        let screenSize = UIScreen.main.bounds.size
        
    }
    
    
    func burgerButton() -> UIBarButtonItem {
        let menuButton = UIBarButtonItem(image: normalImage, style: .plain, target: self, action: #selector(didTabMenuButton))
        
        return menuButton
    }
    
    @objc func didTabMenuButton(){
        if let topViewController = presenter?.topViewController {
            setUpSideMenu(topViewController: topViewController)
                var constraints = [NSLayoutConstraint]()
                if(sideMenuHostingController.view.isHidden){
                    topViewController.navigationItem.rightBarButtonItem?.image = pressedImage
                    UIView.animate(withDuration: 0.5) {
                        if(self.position == sideMenuPosition.right){
                            self.sideMenuHostingController.view.frame.origin.x = topViewController.view.frame.width - self.width
                        }else{
                            self.sideMenuHostingController.view.frame.origin.x = 0
                        }
                        
                    }
                    constraints.append(sideMenuHostingController.view.trailingAnchor.constraint(
                        equalTo: topViewController.view.safeAreaLayoutGuide.trailingAnchor))
                    NSLayoutConstraint.activate(constraints)
                }else{
                    topViewController.navigationItem.rightBarButtonItem?.image = normalImage
                    UIView.animate(withDuration: 0.5) {
                        if(self.position == sideMenuPosition.right){
                            self.sideMenuHostingController.view.frame.origin.x = topViewController.view.frame.width + self.width
                        }else{
                            self.sideMenuHostingController.view.frame.origin.x = 0 - self.width
                        }
                        
                    }
                }
                
                sideMenuHostingController.view.isHidden = !sideMenuHostingController.view.isHidden
        }
    }

    private func setUpSideMenu(topViewController : UIViewController){
            if (isSideMenuSetUped == false){
                
                width = delegate?.sideMenuWidth().rawValue ?? sideMenuWidth.small.rawValue
                position = delegate?.sideMenuPosition() ?? sideMenuPosition.right
                
                topViewController.view.addSubview(sideMenuHostingController.view)
                sideMenuHostingController.view.translatesAutoresizingMaskIntoConstraints = false
                topViewController.addChild(sideMenuHostingController)
                sideMenuHostingController.view.isHidden = true
                sideMenuHostingController.didMove(toParent: topViewController)
                sideMenuHostingController.view.backgroundColor = UIColor(named: "SideMenuColor")
                if(position == sideMenuPosition.right){
                    sideMenuHostingController.view.frame = CGRect(x: topViewController.view.frame.width + width, y: topViewController.view.bounds.maxY, width: width, height: topViewController.view.bounds.height)
                    NSLayoutConstraint.activate([sideMenuHostingController.view.trailingAnchor.constraint(equalTo: topViewController.view.safeAreaLayoutGuide.trailingAnchor, constant: width)])
                }else{
                    sideMenuHostingController.view.frame = CGRect(x: 0 - width, y: topViewController.view.bounds.maxY, width: width, height: topViewController.view.bounds.height)
                    NSLayoutConstraint.activate([sideMenuHostingController.view.leadingAnchor.constraint(equalTo: topViewController.view.safeAreaLayoutGuide.leadingAnchor),sideMenuHostingController.view.trailingAnchor.constraint(equalTo: topViewController.view.safeAreaLayoutGuide.leadingAnchor, constant: width)])
                }
                NSLayoutConstraint.activate([
                    sideMenuHostingController.view.topAnchor.constraint(equalTo: topViewController.view.safeAreaLayoutGuide.topAnchor),
                    sideMenuHostingController.view.widthAnchor.constraint(equalToConstant: width),
                    sideMenuHostingController.view.heightAnchor.constraint(equalTo: topViewController.view.safeAreaLayoutGuide.heightAnchor),
                    sideMenuHostingController.view.bottomAnchor.constraint(equalTo: topViewController.view.safeAreaLayoutGuide.bottomAnchor)])
                isSideMenuSetUped = true
        }
    }
    

}

