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
    
    let article: Article
    
    @IBOutlet weak var articleTitle: UILabel?
    @IBOutlet weak var articleContent: UITextView?
    @IBOutlet weak var articleDate:UILabel?
    @IBOutlet weak var articleAuthor: UILabel?
    @IBOutlet weak var articleImage: UIImageView?
    
    
    private let tableController = ArticleTableViewController()
    

    override func viewDidLoad() {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YY"
        super.viewDidLoad()
        articleTitle?.text = article.title
        articleContent?.text = article.content
        articleDate?.text = dateFormatter.string(from: article.date)
        articleAuthor?.text = article.author
        articleImage?.image = article.image
        self.navigationController?.navigationBar.backItem?.backButtonTitle = " "
        
        let menu = DetailMenuController(with: ["Articles"])
        menu.delegate = self
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        sideMenu?.leftSide = false
        SideMenuManager.default.rightMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("This should never be called!")
    }
     init?(coder: NSCoder, article: Article){
        self.article = article
         super.init(coder: coder)
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
