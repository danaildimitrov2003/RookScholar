//
//  SideMenuProvider.swift
//  RookScholar
//
//  Created by Danail Dimitrov on 25.04.23.
//

import UIKit
import SwiftUI

class SideMenuProvider {
    let normalImage = UIImage(systemName: "line.3.horizontal")
    let pressedImage = UIImage(systemName: "xmark")
    
    
    
    var sideMenuHostingController : UIHostingController <SideMenuUIView>
    var isSideMenuSetUped = false
    
    weak var presenter : UINavigationController?
    
    
    init(presenter: UINavigationController? = nil) {
        
        self.sideMenuHostingController = UIHostingController <SideMenuUIView>(rootView: SideMenuUIView())
        self.presenter = presenter
        
        let screenSize = UIScreen.main.bounds.size
        sideMenuHostingController.view.frame = CGRect(x: 0, y: 0, width: Constants.sideMenuWidth, height: screenSize.height)
        
        sideMenuHostingController.modalPresentationStyle = .overFullScreen
        sideMenuHostingController.view.backgroundColor = UIColor.clear
        
        
    }
    
    
    func burgerButton() -> UIBarButtonItem {
        let menuButton = UIBarButtonItem(image: normalImage, style: .plain, target: self, action: #selector(didTabMenuButton))
        
        return menuButton
    }
    
    @objc func didTabMenuButton(){

        if let topViewController = presenter?.topViewController {
            if (isSideMenuSetUped == false){
                topViewController.view.addSubview(sideMenuHostingController.view)
                sideMenuHostingController.view.translatesAutoresizingMaskIntoConstraints = false
                topViewController.addChild(sideMenuHostingController)
                sideMenuHostingController.view.isHidden = true
                sideMenuHostingController.didMove(toParent: topViewController)
                sideMenuHostingController.view.backgroundColor = UIColor(named: "SideMenuColor")
                sideMenuHostingController.view.frame = CGRect(x: topViewController.view.frame.width + Constants.sideMenuWidth, y: topViewController.view.bounds.maxY, width: Constants.sideMenuWidth, height: topViewController.view.bounds.height)

                NSLayoutConstraint.activate([
                                             
                    sideMenuHostingController.view.topAnchor.constraint(equalTo: topViewController.view.safeAreaLayoutGuide.topAnchor),
                    sideMenuHostingController.view.trailingAnchor.constraint(equalTo: topViewController.view.safeAreaLayoutGuide.trailingAnchor, constant: Constants.sideMenuWidth),
                    sideMenuHostingController.view.widthAnchor.constraint(equalToConstant: Constants.sideMenuWidth),
                    sideMenuHostingController.view.heightAnchor.constraint(equalTo: topViewController.view.safeAreaLayoutGuide.heightAnchor),
                    sideMenuHostingController.view.bottomAnchor.constraint(equalTo: topViewController.view.safeAreaLayoutGuide.bottomAnchor)])
                isSideMenuSetUped = true
            }
           
                var constraints = [NSLayoutConstraint]()
                if(sideMenuHostingController.view.isHidden){
                    topViewController.navigationItem.rightBarButtonItem?.image = pressedImage
                    UIView.animate(withDuration: 0.5) {
                        self.sideMenuHostingController.view.frame.origin.x = topViewController.view.frame.width - Constants.sideMenuWidth
                    }
                    constraints.append(sideMenuHostingController.view.trailingAnchor.constraint(
                        equalTo: topViewController.view.safeAreaLayoutGuide.trailingAnchor))
                    NSLayoutConstraint.activate(constraints)
                }else{
                    topViewController.navigationItem.rightBarButtonItem?.image = normalImage
                    UIView.animate(withDuration: 0.5) {
                        self.sideMenuHostingController.view.frame.origin.x = topViewController.view.frame.width + Constants.sideMenuWidth
                    }
                }
                
                sideMenuHostingController.view.isHidden = !sideMenuHostingController.view.isHidden
            
            
            
            
        }
    }


}

