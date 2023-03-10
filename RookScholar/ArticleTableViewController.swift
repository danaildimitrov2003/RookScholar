//
//  ArticleTableViewController.swift
//  RookScholar
//
//  Created by Danail Dimitrov on 27.02.23.
//

import UIKit
import SideMenu

class ArticleTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MenuControllerDelegate{
    
    
    
    private var sideMenu: SideMenuNavigationController?
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        articleTable.deselectRow(at: indexPath, animated: true)
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let DetailView = storyBoard.instantiateViewController(withIdentifier: "DetailView") as! ArticleDetailViewController
        self.navigationController?.pushViewController(DetailView, animated: true)
        DetailView.article = Articles.articleData[indexPath.row]



    }
    @IBOutlet weak var articleTable: UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        articleTable.register(ArticleTableViewCell.self, forCellReuseIdentifier: "ArticleCell")
        self.navigationItem.setHidesBackButton(true, animated: true)
        articleTable.dataSource = self
        let menu = MenuController(with: ["Articles"])
        menu.delegate = self
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        sideMenu?.leftSide = false
        SideMenuManager.default.rightMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Articles.articleData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YYYY"
        let article = Articles.articleData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleTableViewCell
        cell.articleTitle.text = article.title
        cell.articleContent.text = article.content
        cell.articleDate.text = dateFormatter.string(from: article.date)
      return cell
    }
    
    @IBAction func didTabMenuButton(){
        present(sideMenu!, animated: true)
    }
    func didSelectMenuItem(named: String) {
        sideMenu?.dismiss(animated: true, completion: {
            if named == "Articles"{
                
            }
        })
    }
}



