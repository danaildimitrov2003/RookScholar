//
//  ArticleTableViewController.swift
//  RookScholar
//
//  Created by Danail Dimitrov on 27.02.23.
//

import UIKit
import SideMenu
import SwiftUI

class ArticleTableViewController: UIViewController, UITableViewDataSource{
    
    
    private var sideMenu: SideMenuNavigationController?
    
    var articleTable : UITableView = {
        var articleTable = UITableView()
        articleTable.allowsSelection = true
        articleTable.register(ArticleTableViewCell.self, forCellReuseIdentifier: ArticleTableViewCell.identifier)
        articleTable.translatesAutoresizingMaskIntoConstraints = false
        articleTable.backgroundColor = UIColor(named: "SecondaryColor")
        return articleTable
        
    }()
    
    var  newSideMenu = UIHostingController( rootView: SideMenuUIView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSideMenu()
        setupUI()
    }
    
    @IBAction func didTabMenuButton() {
        var constraints = [NSLayoutConstraint]()
        
        //fix animations here
        if(newSideMenu.view.isHidden){
            UIView.animate(withDuration: 0.5) {
                self.newSideMenu.view.frame = CGRect(x: self.view.frame.maxX-160, y: self.view.frame.maxY, width: self.newSideMenu.view.bounds.width, height: self.newSideMenu.view.bounds.height)
            }
            constraints.append(newSideMenu.view.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor))
            NSLayoutConstraint.activate(constraints)
        }else{
            UIView.animate(withDuration: 0.5) {
                self.newSideMenu.view.frame = CGRect(x: self.view.frame.maxX, y: self.view.frame.maxY, width: self.newSideMenu.view.bounds.width, height: self.newSideMenu.view.bounds.height)
            }
        }
        
        newSideMenu.view.isHidden = !newSideMenu.view.isHidden
    }
    
    
    
    private func setupUI(){
        
        newSideMenu.view.translatesAutoresizingMaskIntoConstraints = false
        addChild(newSideMenu)
        //newSideMenu.view.frame = view.frame
        newSideMenu.view.isHidden = true
        //view.addSubview(newSideMenu.view)
        newSideMenu.didMove(toParent: self)
        newSideMenu.view.backgroundColor = UIColor(named: "SideMenuColor")
        
        
        
        
        articleTable.reloadData()
        articleTable.dataSource = self
        articleTable.delegate = self
        view.addSubview(newSideMenu.view)
        self.navigationItem.setHidesBackButton(true, animated: true)
        NSLayoutConstraint.activate([articleTable.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor),
                                     articleTable.bottomAnchor.constraint(
                                         equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                                     articleTable.leadingAnchor.constraint(
                                         equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                                     articleTable.trailingAnchor.constraint(
                                         equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                                     
                                     
                                    newSideMenu.view.topAnchor.constraint(
                                         equalTo: view.safeAreaLayoutGuide.topAnchor),
                                     newSideMenu.view.trailingAnchor.constraint(
                                         equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 60),
                                     newSideMenu.view.widthAnchor.constraint(
                                         equalToConstant: 160),
                                     newSideMenu.view.heightAnchor.constraint(
                                         equalTo: view.safeAreaLayoutGuide.heightAnchor)
        ])
    }
    
    private func addSideMenu() {
        self.view.addSubview(articleTable)
        let menu = MenuController(with: ["Articles", "Info"])
        menu.delegate = self
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        sideMenu?.leftSide = false
        SideMenuManager.default.rightMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
    }
    
     
}

extension ArticleTableViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return articleTable.bounds.height/4
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        articleTable.deselectRow(at: indexPath, animated: true)
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        lazy var DetailView = storyBoard.instantiateViewController(withIdentifier: "DetailView") as! ArticleDetailViewController
        self.navigationController?.pushViewController(DetailView, animated: true)
        DetailView.article = Articles.articleData[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Articles.articleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YYYY"
        let article = Articles.articleData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.identifier , for: indexPath) as! ArticleTableViewCell
        cell.backgroundColor = UIColor(named: "SecondaryColor")
        cell.articleTitle.text = article.title
        cell.articleContent.text = article.content
        cell.articleDate.text = dateFormatter.string(from: article.date)
        
        return cell
    }
    
    
}

extension ArticleTableViewController : MenuControllerDelegate{
    
    func didSelectMenuItem(named: String) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        sideMenu?.dismiss(animated: true, completion: {
            switch named {
                case "Articles":
                    lazy var ArticleTable = storyBoard.instantiateViewController(withIdentifier: "ArticleTable") as! ArticleTableViewController
                    self.navigationController?.pushViewController(ArticleTable, animated: true)
                case "Info":
                    lazy var InformationView = storyBoard.instantiateViewController(withIdentifier: "InformationView") as! InformationViewController
                    self.navigationController?.pushViewController(InformationView, animated: true)
                
            default:
                print(" ")
            }
        })
    }
}




