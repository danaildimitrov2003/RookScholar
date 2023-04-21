//
//  ArticleDetailViewController.swift
//  RookScholar
//
//  Created by Danail Dimitrov on 28.02.23.
//

import UIKit
import SwiftUI

class ArticleDetailViewController: UIViewController{
    
    
    var article: Article = Article(title: "", author: "", date: Date.now, content: "", image: UIImage(systemName: "\(2).square.fill")!)
    
    var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    let articleTitle : UILabel = {
        let articleTitle = UILabel()
        articleTitle.translatesAutoresizingMaskIntoConstraints = false
        articleTitle.textAlignment = .center
        articleTitle.font = articleTitle.font.withSize(27)
        articleTitle.textColor = .init(named: "SecondaryColor")
        return articleTitle
    }()
    let articleInfo : UILabel = {
        let articleInfo = UILabel()
        articleInfo.translatesAutoresizingMaskIntoConstraints = false
        articleInfo.textAlignment = .center
        articleInfo.textColor = .init(named: "SecondaryColor")
        return articleInfo
    }()
    let articleContent : UITextView = {
        let articleContent = UITextView()
        articleContent.translatesAutoresizingMaskIntoConstraints = false
        articleContent.textAlignment = .center
        articleContent.isScrollEnabled = false
        articleContent.isEditable = false
        articleContent.textColor = .init(named: "MainColor")
        articleContent.backgroundColor = UIColor(named: "SecondaryColor")
        return articleContent
    }()
    let articleImage : UIImageView = {
        let articleImage = UIImageView()
        articleImage.contentMode = UIView.ContentMode.scaleAspectFill
        articleImage.translatesAutoresizingMaskIntoConstraints = false
        articleImage.layer.cornerRadius = 4.0
        articleImage.clipsToBounds = true
        return articleImage
    }()
    var labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        stackView.layer.cornerRadius = 5
        stackView.backgroundColor = .init(named: "MainColor")
        return stackView
    }()
    
    
    var  newSideMenu = UIHostingController( rootView: SideMenuUIView())
    
    let normalImage = UIImage(systemName: "line.3.horizontal")
    let pressedImage = UIImage(systemName: "xmark")
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        addLabels()
        addValues()
    }
    
    @objc func didTabMenuButton() {
        
        var constraints = [NSLayoutConstraint]()
        if(newSideMenu.view.isHidden){
            navigationItem.rightBarButtonItem?.image = pressedImage
            UIView.animate(withDuration: 0.5) {
                self.newSideMenu.view.frame = CGRect(x: self.view.frame.maxX-185, y: 0, width: self.newSideMenu.view.bounds.width, height: self.newSideMenu.view.bounds.height)
            }
            constraints.append(newSideMenu.view.trailingAnchor.constraint(
                equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor))
            NSLayoutConstraint.activate(constraints)
        }else{
            navigationItem.rightBarButtonItem?.image = normalImage
            UIView.animate(withDuration: 0.5) {
                self.newSideMenu.view.frame = CGRect(x: self.view.frame.maxX, y: 0, width: self.newSideMenu.view.bounds.width, height: self.newSideMenu.view.bounds.height) 
            }
        }
        
        newSideMenu.view.isHidden = !newSideMenu.view.isHidden
        

    }
    
    private func addLabels() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: normalImage, style: .plain, target: self, action: #selector(didTabMenuButton))
        
        newSideMenu.view.translatesAutoresizingMaskIntoConstraints = false
        addChild(newSideMenu)
        //newSideMenu.view.frame = view.frame
        newSideMenu.view.isHidden = true
        //view.addSubview(newSideMenu.view)
        newSideMenu.didMove(toParent: self)
        newSideMenu.view.backgroundColor = UIColor(named: "SideMenuColor")
        
        
        
        var constraints = [NSLayoutConstraint]()
        view.addSubview(scrollView)
        
        scrollView.addSubview(labelStackView)
        scrollView.addSubview(articleTitle)
        scrollView.addSubview(articleInfo)
        scrollView.addSubview(articleContent)
        scrollView.addSubview(articleImage)
        scrollView.addSubview(newSideMenu.view)
        
        
        constraints.append(scrollView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(scrollView.bottomAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(scrollView.leadingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(scrollView.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        
        constraints.append(newSideMenu.view.topAnchor.constraint(
            equalTo: scrollView.safeAreaLayoutGuide.topAnchor))
        constraints.append(newSideMenu.view.trailingAnchor.constraint(
            equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: 60))
        constraints.append(newSideMenu.view.widthAnchor.constraint(
            equalToConstant: 185))
        constraints.append(newSideMenu.view.heightAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.heightAnchor))
        
        
        
        
        
        constraints.append(articleTitle.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor))
        constraints.append(articleTitle.topAnchor.constraint(
            equalTo: scrollView.topAnchor, constant: 10))
        
        constraints.append(articleTitle.leadingAnchor.constraint(
            equalTo: scrollView.leadingAnchor))
        constraints.append(articleTitle.trailingAnchor.constraint(
            equalTo: scrollView.trailingAnchor))
        
        constraints.append(articleInfo.topAnchor.constraint(
            equalTo: articleTitle.topAnchor, constant: 30))
        constraints.append(articleInfo.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor))
        constraints.append(articleInfo.leadingAnchor.constraint(
            equalTo: scrollView.leadingAnchor, constant: 10))
        constraints.append(articleInfo.trailingAnchor.constraint(
            equalTo: scrollView.trailingAnchor, constant: -10))
        
        constraints.append(labelStackView.topAnchor.constraint(
            equalTo: scrollView.topAnchor, constant: 10))
        constraints.append(labelStackView.bottomAnchor.constraint(
            equalTo: scrollView.topAnchor, constant: 60))
        constraints.append(labelStackView.leadingAnchor.constraint(
            equalTo: scrollView.leadingAnchor, constant: 10))
        constraints.append(labelStackView.trailingAnchor.constraint(
            equalTo: scrollView.trailingAnchor, constant: -10))
        
        
        constraints.append(articleContent.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 80))
        constraints.append(articleContent.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor))
        constraints.append(articleContent.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10))
        
        constraints.append(articleContent.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -20))
        constraints.append(articleImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 80))
        constraints.append(articleImage.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20))
        
        
        NSLayoutConstraint.activate(constraints)
        
    }
    
    private func addValues() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YYYY"
        articleTitle.text = article.title
        articleContent.text = article.content
        articleInfo.text = "Author: \(article.author), Date: \(dateFormatter.string(from: article.date))"
        articleImage.image = article.image
        articleImage.frame = CGRect(x: 10, y: 10, width: 155, height: 190)
        self.articleContent.textContainer.exclusionPaths = [UIBezierPath(rect: articleImage.frame)]
    }
    
   
}



