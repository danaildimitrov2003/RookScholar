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
    
    
    
   
    @IBSegueAction func showDetail(_ coder: NSCoder) -> ArticleDetailViewController? {
        guard let indexPath = articleTable.indexPathForSelectedRow
          else { fatalError("Nothing selected!") }
        let article = Articles.articleData[indexPath.row]
        return ArticleDetailViewController(coder: coder, article: article)
    }
    @IBOutlet weak var articleTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
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
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Articles.articleData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YY"
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



