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
    
    let normalImage = UIImage(systemName: "line.3.horizontal")
    let pressedImage = UIImage(systemName: "xmark")
    
    
    var  newSideMenu = UIHostingController( rootView: SideMenuUIView())
    
    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()
        setupUI()
    }
    
    @objc func didTabMenuButton() {
        
        
        var constraints = [NSLayoutConstraint]()
        if(newSideMenu.view.isHidden){
            navigationItem.rightBarButtonItem?.image = pressedImage
            UIView.animate(withDuration: 0.5) {
                self.newSideMenu.view.frame.origin.x = self.view.frame.width - self.newSideMenu.view.frame.width
            }
            constraints.append(newSideMenu.view.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor))
            NSLayoutConstraint.activate(constraints)
        }else{
           navigationItem.rightBarButtonItem?.image = normalImage
            UIView.animate(withDuration: 0.5) {
                self.newSideMenu.view.frame.origin.x = self.view.frame.width + self.newSideMenu.view.frame.width
            }
        }
        
        newSideMenu.view.isHidden = !newSideMenu.view.isHidden
    }
    
    
    
    private func setupUI(){
        let sideMenuProvider = SideMenuProvider(presenter: self.navigationController)
        
        navigationItem.rightBarButtonItem = sideMenuProvider.burgerButton()
        
        
        //navigationItem.rightBarButtonItem = UIBarButtonItem(image: normalImage, style: .plain, target: self, action: #selector(didTabMenuButton))
        
        newSideMenu.view.translatesAutoresizingMaskIntoConstraints = false
        addChild(newSideMenu)
        newSideMenu.view.isHidden = true
        newSideMenu.didMove(toParent: self)
        newSideMenu.view.backgroundColor = UIColor(named: "SideMenuColor")
        newSideMenu.view.frame = CGRect(x: view.frame.width + 185, y: view.bounds.maxY, width: 185, height: view.bounds.height)
        
        articleTable.dataSource = self
        articleTable.delegate = self
        view.addSubview(articleTable)
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
                                         equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 185),
                                     newSideMenu.view.widthAnchor.constraint(
                                         equalToConstant: 185),
                                     newSideMenu.view.heightAnchor.constraint(
                                         equalTo: view.safeAreaLayoutGuide.heightAnchor),
                                     newSideMenu.view.bottomAnchor.constraint(
                                            equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                                     
                                     
                                    
                                                                  
                                     
        ])
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






