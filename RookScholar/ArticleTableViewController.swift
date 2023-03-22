//
//  ArticleTableViewController.swift
//  RookScholar
//
//  Created by Danail Dimitrov on 27.02.23.
//

import UIKit
import SideMenu

class ArticleTableViewController: UIViewController{
    
    
    private var sideMenu: SideMenuNavigationController?
    var  isScrolled = 0
    var  isReloaded = 0
    
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
        sideMenu?.dismiss(animated: true, completion: {
            if named == "Articles"{
                
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
        let menu = MenuController(with: ["Articles"])
        menu.delegate = self
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        sideMenu?.leftSide = false
        SideMenuManager.default.rightMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
    }
    
     
}

extension ArticleTableViewController: UITableViewDelegate, UITableViewDataSource, MenuControllerDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        articleTable.deselectRow(at: indexPath, animated: true)
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        isScrolled = 0
        isReloaded = 0
        let DetailView = storyBoard.instantiateViewController(withIdentifier: "DetailView") as! ArticleDetailViewController
        self.navigationController?.pushViewController(DetailView, animated: true)
        DetailView.article = Articles.articleData[indexPath.row]
        articleTable.reloadData()
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
        
        if(indexPath.row > 3){
            cell.isHidden = true
            if(isScrolled > 2){
                ArticleTableViewCell.animate(withDuration: 0.5, delay: 0.2, options: [.transitionCurlDown], animations: {
                    cell.frame.origin.y += 100 
                }, completion: nil)
                cell.isHidden = false
            }
        }
        
        return cell
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        isScrolled += 1
        if(isScrolled > 2){
            if(isReloaded == 1){
                articleTable.reloadData()
                isReloaded += 1
            }else if(isReloaded < 1){
                isReloaded += 1
            }
        }
    }
    
}



