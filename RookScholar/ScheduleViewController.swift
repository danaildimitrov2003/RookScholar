//
//  ScheduleViewController.swift
//  RookScholar
//
//  Created by Danail Dimitrov on 30.03.23.
//

import UIKit
import WebKit
import SwiftUI

class ScheduleViewController: UIViewController{

    
    let tournamentsScheduleWebView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    var  newSideMenu = UIHostingController( rootView: SideMenuUIView())
    
    let normalImage = UIImage(systemName: "line.3.horizontal")
    let pressedImage = UIImage(systemName: "xmark")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @objc func didTabMenuButton() {
        //fix animations here
        var constraints = [NSLayoutConstraint]()
        if(newSideMenu.view.isHidden){
            navigationItem.rightBarButtonItem?.image = pressedImage
            UIView.animate(withDuration: 0.5) {
                self.newSideMenu.view.frame = CGRect(x: self.view.frame.maxX-185, y: 0, width: self.newSideMenu.view.bounds.width, height: self.newSideMenu.view.bounds.height)
            }
            constraints.append(newSideMenu.view.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor))
            NSLayoutConstraint.activate(constraints)
        }else{
            navigationItem.rightBarButtonItem?.image = normalImage
            UIView.animate(withDuration: 0.5) {
                self.newSideMenu.view.frame = CGRect(x: self.view.frame.maxX, y: 0, width: self.newSideMenu.view.bounds.width, height: self.newSideMenu.view.bounds.height)
            }
        }
        
        newSideMenu.view.isHidden = !newSideMenu.view.isHidden
    }
    
    
    private func setupUI(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: normalImage, style: .plain, target: self, action: #selector(didTabMenuButton))
        
        newSideMenu.view.translatesAutoresizingMaskIntoConstraints = false
        addChild(newSideMenu)
        //newSideMenu.view.frame = view.frame
        newSideMenu.view.isHidden = true
        //view.addSubview(newSideMenu.view)
        newSideMenu.didMove(toParent: self)
        newSideMenu.view.backgroundColor = UIColor(named: "SideMenuColor")
        
        self.navigationItem.title = "RookScholar"
        view.addSubview(tournamentsScheduleWebView)
        view.addSubview(newSideMenu.view)
        tournamentsScheduleWebView.load(URLRequest(url: URL(string: "https://www.fide.com/calendar")!))
        var constraints = [NSLayoutConstraint]()
        constraints.append(tournamentsScheduleWebView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(tournamentsScheduleWebView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(tournamentsScheduleWebView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(tournamentsScheduleWebView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        
        constraints.append(newSideMenu.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(newSideMenu.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 60))
        constraints.append(newSideMenu.view.widthAnchor.constraint(equalToConstant: 185))
        constraints.append(newSideMenu.view.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor))
        
        NSLayoutConstraint.activate(constraints)
        
    }
    

}

