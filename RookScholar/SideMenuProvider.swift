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
    
    init(presenter: UINavigationController?) {
        
        self.sideMenuHostingController = UIHostingController <SideMenuUIView>(rootView: SideMenuUIView())
        self.presenter = presenter
    }
    
    func burgerButton() -> UIBarButtonItem {
        let menuButton = UIBarButtonItem(image: normalImage, style: .plain, target: self, action: #selector(didTabMenuButton))
        
        return menuButton
    }
    
    @objc func didTabMenuButton(){
        print("11")

    }
}
