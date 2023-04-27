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
    
    weak var presenter : UINavigationController?
    
    init(presenter: UINavigationController? = nil) {
        
        self.sideMenuHostingController = UIHostingController <SideMenuUIView>(rootView: SideMenuUIView())
        self.presenter = presenter
        
        let screenSize = UIScreen.main.bounds.size
        sideMenuHostingController.view.frame = CGRect(x: 0, y: 0, width: 185, height: screenSize.height)
        
        sideMenuHostingController.modalPresentationStyle = .overFullScreen
        sideMenuHostingController.view.backgroundColor = UIColor.clear
        
    }
    
    
    func burgerButton() -> UIBarButtonItem {
        let menuButton = UIBarButtonItem(image: normalImage, style: .plain, target: self, action: #selector(didTabMenuButton))
        
        return menuButton
    }
    
    @objc func didTabMenuButton(){
       
        DispatchQueue.main.async { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.presenter?.topViewController?.present (weakSelf.sideMenuHostingController, animated: true)
        }
        
    }
}

