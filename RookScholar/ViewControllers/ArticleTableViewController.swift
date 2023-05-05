//
//  ArticleTableViewController.swift
//  RookScholar
//
//  Created by Danail Dimitrov on 27.02.23.
//

import UIKit
import SwiftUI


class ArticleTableViewController: UIViewController, UITableViewDataSource{
        
    var articleTable : UITableView = {
        var articleTable = UITableView()
        articleTable.allowsSelection = true
        articleTable.register(ArticleTableViewCell.self, forCellReuseIdentifier: ArticleTableViewCell.identifier)
        articleTable.translatesAutoresizingMaskIntoConstraints = false
        articleTable.backgroundColor = UIColor(named: "SecondaryColor")
        return articleTable
        
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
        articleTable.dataSource = self
        articleTable.delegate = self
        view.addSubview(articleTable)
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        NSLayoutConstraint.activate([articleTable.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor),
                                     articleTable.bottomAnchor.constraint(
                                         equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                                     articleTable.leadingAnchor.constraint(
                                         equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                                     articleTable.trailingAnchor.constraint(
                                         equalTo: view.safeAreaLayoutGuide.trailingAnchor),])
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
extension ArticleTableViewController:SideMenuDelegate{
    func sideMenuPosition() -> sideMenuPosition {
        .right
    }
    
    func sideMenuWidth() -> sideMenuWidth {
        .small
    }
    
}






