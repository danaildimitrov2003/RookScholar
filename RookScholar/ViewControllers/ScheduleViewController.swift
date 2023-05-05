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
    
    var sideMenuProvider = SideMenuProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    
    
    private func setupUI(){
        sideMenuProvider = SideMenuProvider(presenter: self.navigationController)
        navigationItem.rightBarButtonItem = sideMenuProvider.burgerButton()
        sideMenuProvider.delegate = self

        
        self.navigationItem.title = "RookScholar"
        view.addSubview(tournamentsScheduleWebView)
        tournamentsScheduleWebView.load(URLRequest(url: URL(string: "https://www.fide.com/calendar")!))
        var constraints = [NSLayoutConstraint]()
        constraints.append(tournamentsScheduleWebView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(tournamentsScheduleWebView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(tournamentsScheduleWebView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(tournamentsScheduleWebView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        
        
        NSLayoutConstraint.activate(constraints)
        
    }
    

}

extension ScheduleViewController: SideMenuDelegate{
    func sideMenuWidth() -> sideMenuWidth {
        .small
    }
    
    func sideMenuPosition() -> sideMenuPosition {
        .right
    }
    
    
}

