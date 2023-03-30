//
//  ScheduleViewController.swift
//  RookScholar
//
//  Created by Danail Dimitrov on 30.03.23.
//

import UIKit
import WebKit
import SideMenu

class ScheduleViewController: UIViewController, MenuControllerDelegate {

    private var sideMenu: SideMenuNavigationController?
    
    let tournamentsScheduleWebView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addSideMenu()
    }
    
    @IBAction func didTabMenuButton() {
        
        present(sideMenu!, animated: true)
    }
    
    func didSelectMenuItem(named: String) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        sideMenu?.dismiss(animated: true, completion: {
            
            switch named {
                case "Articles":
                    let ArticleTable = storyBoard.instantiateViewController(withIdentifier: "ArticleTable") as! ArticleTableViewController
                    self.navigationController?.pushViewController(ArticleTable, animated: true)
                case "Info":
                    let InformationView = storyBoard.instantiateViewController(withIdentifier: "InformationView") as! InformationViewController
                    self.navigationController?.pushViewController(InformationView, animated: true)
                
            default:
                print(" ")
            }
        })
    }
    
    private func setupUI(){
        self.navigationItem.backButtonTitle = "toma"
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
    private func addSideMenu() {
        let menu = MenuController(with: ["Articles", "Info"])
        menu.delegate = self
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        sideMenu?.leftSide = false
        SideMenuManager.default.rightMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
    }

}
