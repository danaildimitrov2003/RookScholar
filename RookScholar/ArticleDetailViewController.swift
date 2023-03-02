//
//  ArticleDetailViewController.swift
//  RookScholar
//
//  Created by Danail Dimitrov on 28.02.23.
//

import UIKit

class ArticleDetailViewController: UIViewController{
    
    let article: Article
    
    @IBOutlet weak var articleTitle: UILabel?
    @IBOutlet weak var articleContent: UITextView?
    @IBOutlet weak var articleDate:UILabel?
    @IBOutlet weak var articleAuthor: UILabel?
    @IBOutlet weak var articleImage: UIImageView?
    
    
    
    
    

    override func viewDidLoad() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YY"
        super.viewDidLoad()
        articleTitle?.text = article.title
        articleContent?.text = article.content
        articleDate?.text = dateFormatter.string(from: article.date)
        articleAuthor?.text = article.author
        articleImage?.image = article.image
                
    }
    
    required init?(coder: NSCoder) {
        fatalError("This should never be called!")
    }
     init?(coder: NSCoder, article: Article){
        self.article = article
         super.init(coder: coder)
    }
}
