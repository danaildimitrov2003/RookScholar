//
//  ArticleTableViewController.swift
//  RookScholar
//
//  Created by Danail Dimitrov on 27.02.23.
//

import UIKit
import SideMenu

class ArticleTableViewController: UIViewController, UITableViewDataSource{
    
    
    private var sideMenu: SideMenuNavigationController?
    
    var articleTable : UITableView = {
        var articleTable = UITableView()
        articleTable.allowsSelection = true
        articleTable.register(ArticleTableViewCell.self, forCellReuseIdentifier: ArticleTableViewCell.identifier)
        articleTable.translatesAutoresizingMaskIntoConstraints = false
        return articleTable
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSideMenu()
        setupUI()
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
        articleTable.reloadData()
        articleTable.dataSource = self
        articleTable.delegate = self
        self.navigationItem.setHidesBackButton(true, animated: true)
        NSLayoutConstraint.activate([articleTable.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor),
                                     articleTable.bottomAnchor.constraint(
                                         equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                                     articleTable.leadingAnchor.constraint(
                                         equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                                     articleTable.trailingAnchor.constraint(
                                         equalTo: view.safeAreaLayoutGuide.trailingAnchor),
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

extension ArticleTableViewController: UITableViewDelegate, MenuControllerDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return articleTable.bounds.height/4
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        articleTable.deselectRow(at: indexPath, animated: true)
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let DetailView = storyBoard.instantiateViewController(withIdentifier: "DetailView") as! ArticleDetailViewController
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
        cell.articleTitle.text = article.title
        cell.articleContent.text = article.content
        cell.articleDate.text = dateFormatter.string(from: article.date)
        
        return cell
    }
    
    
}



