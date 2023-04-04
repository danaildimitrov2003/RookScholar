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
        articleTitle.textColor = .init(named: "SecondaryColor")
        return articleTitle
    }()
    let articleContent : UILabel = {
        let articleContent = UILabel()
        articleContent .translatesAutoresizingMaskIntoConstraints = false
        articleContent .textAlignment = .center
        articleContent.textColor = .init(named: "MainColor")
        return articleContent
    }()
    let articleDate : UILabel = {
        let articleDate = UILabel()
        articleDate .translatesAutoresizingMaskIntoConstraints = false
        articleDate .textAlignment = .center
        articleDate.textColor = .init(named: "SecondaryColor")
        articleDate.backgroundColor = .init(named: "MainColor")
        return articleDate
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
    
    private func addLabels() {
        
        
        addSubview(labelStackView)
        addSubview(articleContent)
        labelStackView.addArrangedSubview(articleTitle)
        labelStackView.addArrangedSubview(articleDate)
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(labelStackView.leadingAnchor.constraint(
            equalTo: leadingAnchor, constant: 10))
        constraints.append(labelStackView.trailingAnchor.constraint(
            equalTo: trailingAnchor, constant: -10))
        
        constraints.append(labelStackView.topAnchor.constraint(
            equalTo: topAnchor))
        
        constraints.append(articleTitle.leadingAnchor.constraint(
            equalTo: labelStackView.leadingAnchor, constant: 5))
        
        constraints.append(articleTitle.topAnchor.constraint(
            equalTo: labelStackView.topAnchor, constant: 10))
        
        constraints.append(articleContent.leadingAnchor.constraint(
            equalTo: leadingAnchor, constant: 10))
        constraints.append(articleContent.trailingAnchor.constraint(
          equalTo: trailingAnchor, constant: -10))
        constraints.append(articleContent.topAnchor.constraint(
            equalTo: topAnchor, constant: 40))
        
        constraints.append(articleDate.trailingAnchor.constraint(
            equalTo: labelStackView.trailingAnchor))
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
