//
//  ArticleTableViewCell.swift
//  RookScholar
//
//  Created by Danail Dimitrov on 27.02.23.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    
    
    let articleTitle : UILabel = {
        let articleTitle = UILabel()
        articleTitle .translatesAutoresizingMaskIntoConstraints = false // enable auto-layout
        articleTitle .textAlignment = .center // text alignment in center
        return articleTitle
    }()
    let articleContent : UILabel = {
        let articleContent = UILabel()
        articleContent .translatesAutoresizingMaskIntoConstraints = false // enable auto-layout
        articleContent .textAlignment = .center // text alignment in center
        return articleContent
    }()
    let articleDate : UILabel = {
        let articleDate = UILabel()
        articleDate .translatesAutoresizingMaskIntoConstraints = false // enable auto-layout
        articleDate .textAlignment = .center // text alignment in center
        return articleDate
    }()
    
    private func addLabels() {
        addSubview(articleTitle)
        addSubview(articleContent)
        addSubview(articleDate)
        var constraints = [NSLayoutConstraint]()
        constraints.append(articleTitle.leadingAnchor.constraint(
            equalTo: leadingAnchor, constant: 10))
        //constraints.append(articleTitle.trailingAnchor.constraint(
        //  equalTo: trailingAnchor, constant: 10))
        constraints.append(articleTitle.topAnchor.constraint(
            equalTo: topAnchor, constant: 10))
        //constraints.append(articleTitle.bottomAnchor.constraint(
           // equalTo: bottomAnchor, constant: 10))
        
        constraints.append(articleContent.leadingAnchor.constraint(
            equalTo: leadingAnchor, constant: 10))
        constraints.append(articleContent.trailingAnchor.constraint(
          equalTo: trailingAnchor, constant: -10))
        constraints.append(articleContent.topAnchor.constraint(
            equalTo: topAnchor, constant: 40))
        //constraints.append(articleContent.bottomAnchor.constraint(
          //  equalTo: bottomAnchor, constant: 10))
        
        //constraints.append(articleDate.leadingAnchor.constraint(
         //   equalTo: articleTitle.leadingAnchor, constant: 140))
        constraints.append(articleDate.trailingAnchor.constraint(
            equalTo: trailingAnchor, constant: -10))
        constraints.append(articleDate.topAnchor.constraint(
            equalTo: topAnchor, constant: 10))
       // constraints.append(articleDate.bottomAnchor.constraint(
        //   equalTo: bottomAnchor, constant: 10))

        NSLayoutConstraint.activate(constraints)
  
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addLabels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
