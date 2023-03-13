//
//  ArticleDetailViewController.swift
//  RookScholar
//
//  Created by Danail Dimitrov on 28.02.23.
//

import UIKit
import SideMenu

class ArticleDetailViewController: UIViewController, DetailMenuControllerDelegate{
    
    
    private var sideMenu: SideMenuNavigationController?
    
    var article: Article = Article(title: "", author: "", date: Date.now, content: "", image: UIImage(systemName: "\(2).square.fill")!)
    
    
    let articleTitle : UILabel = {
        let articleTitle = UILabel()
        articleTitle.translatesAutoresizingMaskIntoConstraints = false
        articleTitle.textAlignment = .center
        articleTitle.font = articleTitle.font.withSize(27)
        return articleTitle
    }()
    let articleInfo : UILabel = {
        let articleInfo = UILabel()
        articleInfo.translatesAutoresizingMaskIntoConstraints = false
        articleInfo.textAlignment = .center
        return articleInfo
    }()
    let articleContent : UITextView = {
        let articleContent = UITextView()
        articleContent.translatesAutoresizingMaskIntoConstraints = false
        articleContent.textAlignment = .center
        articleContent.isScrollEnabled = false
        articleContent.isEditable = false
        return articleContent
    }()
    let articleImage : UIImageView = {
        let articleImage = UIImageView()
        articleImage.contentMode = UIView.ContentMode.scaleAspectFill
        articleImage.translatesAutoresizingMaskIntoConstraints = false
        //articleImage.frame = CGRect(x: 47, y: 191, width: 140, height: 214)
        return articleImage
    }()
    private func addLabels() {
        view.addSubview(articleTitle)
        view.addSubview(articleInfo)
        view.addSubview(articleContent)
        view.addSubview(articleImage)
        var constraints = [NSLayoutConstraint]()
        constraints.append(articleTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(articleTitle.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10))
        
        constraints.append(articleInfo.topAnchor.constraint(
            equalTo: articleTitle.topAnchor, constant: 30))
        constraints.append(articleInfo.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(articleInfo.leadingAnchor.constraint(
            equalTo: view.leadingAnchor, constant: 10))
        constraints.append(articleInfo.trailingAnchor.constraint(
            equalTo: view.trailingAnchor, constant: -10))
        
        
        constraints.append(articleContent.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80))
        constraints.append(articleContent.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10))
        constraints.append(articleContent.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10))
        
        constraints.append(articleImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80))
        constraints.append(articleImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10))
        //constraints.append(articleImage.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 107))
        //constraints.append(articleImage.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 70))
        //constraints.append(articleImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10))
        
//        constraints.append(articleContent.leadingAnchor.constraint(
//            equalTo: view.leadingAnchor, constant: 10))
//        constraints.append(articleContent.trailingAnchor.constraint(
//            equalTo: view.trailingAnchor, constant: -10))
       

        NSLayoutConstraint.activate(constraints)
        
    }
        
    
    private let tableController = ArticleTableViewController()
    

    override func viewDidLoad() {
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YY"
        super.viewDidLoad()
        articleTitle.text = article.title
        articleContent.text = article.content
        articleInfo.text = "Author: \(article.author), Date: \(dateFormatter.string(from: article.date))"
        
        articleImage.image = article.image
        //articleImage.frame = CGRect(x: 47, y: 191, width: 140, height: 214)
//        articleContent?.frame =  CGRect(x: 47, y: 191, width: 330, height: 640)
//        articleContent!.textContainer.exclusionPaths = [UIBezierPath(rect: articleImage!.frame)]
        
        self.navigationController?.navigationBar.backItem?.backButtonTitle = " "
        
        let menu = DetailMenuController(with: ["Articles"])
        menu.delegate = self
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        sideMenu?.leftSide = false
        SideMenuManager.default.rightMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        addLabels()
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
