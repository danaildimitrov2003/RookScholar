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
    
    var scrollView = UIScrollView()
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
        return articleImage
    }()
    private func addLabels() {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - 20))
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height)
        view.addSubview(scrollView)
        scrollView.addSubview(articleTitle)
        scrollView.addSubview(articleInfo)
        scrollView.addSubview(articleContent)
        scrollView.addSubview(articleImage)
        var constraints = [NSLayoutConstraint]()
        constraints.append(articleTitle.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor))
        constraints.append(articleTitle.topAnchor.constraint(
            equalTo: scrollView.topAnchor, constant: 10))
        
        constraints.append(articleInfo.topAnchor.constraint(
            equalTo: articleTitle.topAnchor, constant: 30))
        constraints.append(articleInfo.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(articleInfo.leadingAnchor.constraint(
            equalTo: view.leadingAnchor, constant: 10))
        constraints.append(articleInfo.trailingAnchor.constraint(
            equalTo: view.trailingAnchor, constant: -10))
        
        
        constraints.append(articleContent.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 80))
        constraints.append(articleContent.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10))
        constraints.append(articleContent.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -20))
        constraints.append(articleImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 80))
        constraints.append(articleImage.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20))
        

        NSLayoutConstraint.activate(constraints)
        
    }
        
    
    private let tableController = ArticleTableViewController()
    

    override func viewDidLoad() {
        
        addLabels()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YYYY"
        super.viewDidLoad()
        articleTitle.text = article.title
        articleContent.text = article.content
        articleInfo.text = "Author: \(article.author), Date: \(dateFormatter.string(from: article.date))"
        articleImage.image = article.image
        articleImage.frame = CGRect(x: 10, y: 10, width: 155, height: 190)
        self.articleContent.textContainer.exclusionPaths = [UIBezierPath(rect: articleImage.frame)]
        
        self.navigationController?.navigationBar.backItem?.backButtonTitle = " "
        let menu = DetailMenuController(with: ["Articles"])
        menu.delegate = self
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        sideMenu?.leftSide = false
        SideMenuManager.default.rightMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height)
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
