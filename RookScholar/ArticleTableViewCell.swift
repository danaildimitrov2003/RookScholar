//
//  ArticleTableViewCell.swift
//  RookScholar
//
//  Created by Danail Dimitrov on 27.02.23.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    static let  identifier = "ArticleTableViewCell"
    
    let articleTitle : UILabel = {
        let articleTitle = UILabel()
        articleTitle .translatesAutoresizingMaskIntoConstraints = false
        articleTitle .textAlignment = .center
        return articleTitle
    }()
    let articleContent : UILabel = {
        let articleContent = UILabel()
        articleContent .translatesAutoresizingMaskIntoConstraints = false
        articleContent .textAlignment = .center
        return articleContent
    }()
    let articleDate : UILabel = {
        let articleDate = UILabel()
        articleDate .translatesAutoresizingMaskIntoConstraints = false
        articleDate .textAlignment = .center 
        return articleDate
    }()
    
    private func addLabels() {
        addSubview(articleTitle)
        addSubview(articleContent)
        addSubview(articleDate)
        var constraints = [NSLayoutConstraint]()
        constraints.append(articleTitle.leadingAnchor.constraint(
            equalTo: leadingAnchor, constant: 10))
        
        constraints.append(articleTitle.topAnchor.constraint(
            equalTo: topAnchor, constant: 10))
        
        constraints.append(articleContent.leadingAnchor.constraint(
            equalTo: leadingAnchor, constant: 10))
        constraints.append(articleContent.trailingAnchor.constraint(
          equalTo: trailingAnchor, constant: -10))
        constraints.append(articleContent.topAnchor.constraint(
            equalTo: topAnchor, constant: 40))
        
        constraints.append(articleDate.trailingAnchor.constraint(
            equalTo: trailingAnchor, constant: -10))
        constraints.append(articleDate.topAnchor.constraint(
            equalTo: topAnchor, constant: 10))
       
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
