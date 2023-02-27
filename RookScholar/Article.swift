//
//  Article.swift
//  RookScholar
//
//  Created by Danail Dimitrov on 27.02.23.
//

import UIKit

struct Article{
    let title: String
    let author: String
    let date: Date
    let content: String
    let image: UIImage
}



let  articleData: [Article] = [
Article(title: "Article1", author: "Toma", date: Date.now, content: "coool stuf really cool stuf", image: UIImage(systemName: "\(1).square.fill")!),
Article(title: "Article2", author: "Toma", date: Date.now, content: "coool stuf really cool stuf", image: UIImage(systemName: "\(2).square.fill")!),
Article(title: "Article3", author: "Toma", date: Date.now, content: "coool stuf really cool stuf", image: UIImage(systemName: "\(3).square.fill")!),
Article(title: "Article4", author: "Toma", date: Date.now, content: "coool stuf really cool stuf", image: UIImage(systemName: "\(4).square.fill")!),
]
