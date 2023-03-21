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
//test


enum Articles{
    static let  articleData: [Article] = [
        Article(title: "The Prince’s Gambit", author: "D. T. Max", date: Date.now, content: "In many ways, tournament chess is still played very much as it was a century ago. Players land their pieces with the delicate thump of baize on wood, then jot their moves on scoresheets and tap the clock forcefully, or gently, depending on the mood they wish to communicate to their opponents. Flanking attendants, called arbiters, make sure that nobody cheats. It’s still quiet enough at a tournament that, among the spectators, you can hear your neighbors’ breathing. But the game has changed in at least one fundamental respect: it is now monitored, and even shaped, by computers. Chess pieces are embedded with magnetic sensors that transmit their location on the board to a computer, which relays this information to the Internet. Online, chess programs provide running commentary, evaluating which player is ahead and whether the move he or she is making is brilliant or a blunder. In a modern tournament, just about the only people who don’t know precisely how well they are doing are the players. But by the sixth round of the London Chess Classic, in December, Magnus Carlsen, the Norwegian phenom, knew that he was behind. If he lost the game, having already been defeated in two earlier ones, he would probably lose the tournament. He was No. 2 in the world rankings, and a victory would give him a good shot at recovering the top spot; he had played inconsistently in recent months, falling from No. 1. There was talk that he was distracted, underprepared, and overexposed. Chess players trying to get out of trouble act a lot like students taking an exam that they haven’t studied for. Carlsen, who had turned twenty just two weeks earlier, often gives off a vibe of someone who is too cool to do his homework, but now he looked a bit panicked. He cupped his head in his hands, rocked his body, and stared at the board, trying to reboot his brain. At one point, it took him twenty-seven minutes to move a piece.Carlsen’s problems had begun on his second move. Playing black, he had sent out his queen-side knight beyond his pawns—an unusual decision, given that his opponent, the thirty-five-year-old Russian champion Vladimir Kramnik, had already placed two white pawns in the center of the board. So Kramnik had a nice line of pawns where they would do the most good, and Carlsen had a poorly placed piece that threatened to block any attack he might want to mount. A database of nearly five million games indicated that, when these moves were made, white was twice as likely to win as black; Carlsen was already at a significant disadvantage.Kramnik, one of the last players trained by the old Soviet chess machine, was eerily steady before the board—at times nearly motionless. Carlsen’s eyelids fluttered in a trance of concentration. He looked boyish in a crisp white shirt and a pair of slim-fit pants that had been given to him by G-Star raw, the Dutch fashion company, with which he has an endorsement deal.", image: UIImage(named: "magnus")!),
    Article(title: "Article2", author: "Toma", date: Date.now, content: "coool stuf really cool stuf", image: UIImage(systemName: "\(2).square.fill")!),
    Article(title: "Article3", author: "Toma", date: Date.now, content: "coool stuf really cool stuf", image: UIImage(systemName: "\(3).square.fill")!),
    Article(title: "Article4", author: "Toma", date: Date.now, content: "coool stuf really cool stuf", image: UIImage(systemName: "\(4).square.fill")!),
    Article(title: "Article5", author: "Toma", date: Date.now, content: "coool stuf really cool stuf", image: UIImage(systemName: "\(5).square.fill")!),
    ]
}

