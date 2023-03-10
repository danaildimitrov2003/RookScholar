//
//  ArticleDetailViewController.swift
//  RookScholar
//
//  Created by Danail Dimitrov on 28.02.23.
//

import UIKit
import SideMenu

class ArticleDetailViewController: UIViewController, MenuControllerDelegate, DetailMenuControllerDelegate{
    
    
    private var sideMenu: SideMenuNavigationController?
    
    var article: Article = Article(title: "", author: "", date: Date.now, content: "", image: UIImage(systemName: "\(2).square.fill")!)
    
    
    let articleTitle : UILabel = {
        let articleTitle = UILabel()
        articleTitle .translatesAutoresizingMaskIntoConstraints = false // enable auto-layout
        articleTitle .textAlignment = .center // text alignment in center
        return articleTitle
    }()
    let articleInfo : UILabel = {
        let articleInfo = UILabel()
        articleInfo .translatesAutoresizingMaskIntoConstraints = false // enable auto-layout
        articleInfo .textAlignment = .center // text alignment in center
        return articleInfo
    }()
    let articleContent : UITextView = {
        let articleContent = UITextView()
        articleContent .translatesAutoresizingMaskIntoConstraints = false // enable auto-layout
        articleContent .textAlignment = .center // text alignment in center
        return articleContent
    }()
    let articleImage : UIImageView = {
        let articleImage = UIImageView()
        articleImage .translatesAutoresizingMaskIntoConstraints = false // enable auto-layout
        return articleImage
    }()
    
        
    
    private let tableController = ArticleTableViewController()
    

    override func viewDidLoad() {
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YY"
        super.viewDidLoad()
        articleTitle.text = article.title
        articleContent.text = article.content
        articleInfo.text = "Author: \(article.author), Date: \(dateFormatter.string(from: article.date))"
        
        articleImage.image = article.image
//        articleImage?.frame = CGRect(x: 47, y: 191, width: 140, height: 214)
//        articleContent?.frame =  CGRect(x: 47, y: 191, width: 330, height: 640)
//        articleContent!.textContainer.exclusionPaths = [UIBezierPath(rect: articleImage!.frame)]
        
        self.navigationController?.navigationBar.backItem?.backButtonTitle = " "
        
        let menu = DetailMenuController(with: ["Articles"])
        menu.delegate = self
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        sideMenu?.leftSide = false
        SideMenuManager.default.rightMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        
    }
    
    

    @IBAction func didTabMenuButton(){
        present(sideMenu!, animated: true)
    }
    func didSelectMenuItem(named: String) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let ArticleTable = storyBoard.instantiateViewController(withIdentifier: "ArticleTable") as! ArticleTableViewController
        sideMenu?.dismiss(animated: true, completion: {
            if named == "Articles"{
                
                self.navigationController?.pushViewController(ArticleTable, animated: true)
            }
        })
    }

    
    
}
