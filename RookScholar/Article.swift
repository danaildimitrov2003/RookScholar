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



enum Articles{
    static let  articleData: [Article] = [
        Article(title: "The Prince’s Gambit", author: "D. T. Max", date: Date.now, content: "still played very much as it was a century ago. Players land their pieces with the delicate thump of baize on wood, then jot their moves on scoresheets and tap the clock forcefully, or gently, depending on the mood they wish to communicate to their opponents. Flanking attendants, called arbiters, make sure that nobody cheats. It’s still quiet enough at a tournament that, among the spectators, you can hear your neighbors’ breathing. But the game has changed in at least one fundamental respect: it is now monitored, and even shaped, by computers. Chess pieces are embedded with magnetic sensors that transmit their location on the board to a computer, which relays this information to the Internet. Online, chess programs provide running commentary, evaluating which player is ahead and whether the move he or she is making is brilliant or a blunder. In a modern tournament, just about the only people who don’t know precisely how well they are doing are the players.", image: UIImage(systemName: "\(1).square.fill")!),
    Article(title: "Article2", author: "Toma", date: Date.now, content: "coool stuf really cool stuf", image: UIImage(systemName: "\(2).square.fill")!),
    Article(title: "Article3", author: "Toma", date: Date.now, content: "coool stuf really cool stuf", image: UIImage(systemName: "\(3).square.fill")!),
    Article(title: "Article4", author: "Toma", date: Date.now, content: "coool stuf really cool stuf", image: UIImage(systemName: "\(4).square.fill")!),
    ]
}

