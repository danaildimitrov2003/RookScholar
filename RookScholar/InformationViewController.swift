//
//  InformationViewController.swift
//  RookScholar
//
//  Created by Danail Dimitrov on 23.03.23.
//

import UIKit

class InformationViewController: UIViewController {
    
    
    var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    var stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 20
        return stackView
    }()
    
    var historyTextView: UITextView = {
       var textView = UITextView()
        
        textView = textView.setupInformationTextView()
        
        return textView
    }()
    
    var rulesTextView: UITextView = {
       var textView = UITextView()
        
        textView = textView.setupInformationTextView()
        
        return textView
    }()
    
    var tournamentsTextView: UITextView = {
       var textView = UITextView()
        
        textView = textView.setupInformationTextView()
        
        return textView
    }()
    
    
//    var tournamentsView: UIView = {
//        let uiView = UIView()
//        uiView.backgroundColor = .systemBlue
//        return uiView
//    }()
    
    var tournamentButtonsStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        return stackView
    }()
    
    var pastButton: UIButton = {
       let uiButton = UIButton()
        uiButton.setTitle("Past", for: .normal)
        uiButton.backgroundColor = .orange
        uiButton.translatesAutoresizingMaskIntoConstraints = false
        return uiButton
    }()
    
    var futureButton: UIButton = {
       let uiButton = UIButton()
        uiButton.setTitle("Future", for: .normal)
        uiButton.backgroundColor = .blue
        uiButton.translatesAutoresizingMaskIntoConstraints = false
        return uiButton
    }()
    
    var ongoingButton: UIButton = {
       let uiButton = UIButton()
        uiButton.setTitle("Ongoing", for: .normal)
        uiButton.backgroundColor = .green
        uiButton.translatesAutoresizingMaskIntoConstraints = false
        return uiButton
    }()
    
    var tournamentStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addValues()
        setupUI()
        
    }
    
    private func setupUI(){
        pastButton.addTarget(self, action:#selector(self.pastClicked), for: .touchUpInside)
        futureButton.addTarget(self, action:#selector(self.futureClicked), for: .touchUpInside)
        ongoingButton.addTarget(self, action:#selector(self.ongoingClicked), for: .touchUpInside)
        var constraints = [NSLayoutConstraint]()
       // scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height)
        view.addSubview(scrollView)
        //scrollView.addSubview(stackView)
        scrollView.addSubview(historyTextView)
        scrollView.addSubview(rulesTextView)
        scrollView.addSubview(tournamentButtonsStackView)
        scrollView.addSubview(tournamentsTextView)
        
        
        //tournamentStackView.addArrangedSubview(tournamentButtonsStackView)
        //tournamentStackView.addArrangedSubview(tournamentsTextView)
        tournamentButtonsStackView.addArrangedSubview(pastButton)
        tournamentButtonsStackView.addArrangedSubview(futureButton)
        tournamentButtonsStackView.addArrangedSubview(ongoingButton)
        
        
        
        constraints.append(scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        //constraints.append(scrollView.widthAnchor.constraint(equalTo: view.widthAnchor))
        //scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        
        constraints.append(historyTextView.topAnchor.constraint(equalTo: scrollView.topAnchor))
        //constraints.append(historyTextView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor))
        constraints.append(historyTextView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor))
        //constraints.append(historyTextView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor))
        constraints.append(historyTextView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor))
        
        constraints.append(rulesTextView.topAnchor.constraint(equalTo: historyTextView.bottomAnchor, constant: 10))
        //constraints.append(rulesTextView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor))
        constraints.append(rulesTextView.leadingAnchor.constraint(equalTo: historyTextView.leadingAnchor))
        //constraints.append(rulesTextView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor))
        constraints.append(rulesTextView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor ))
        
        
        
      constraints.append(tournamentButtonsStackView.topAnchor.constraint(equalTo: rulesTextView.bottomAnchor, constant: 10))
//           constraints.append(tournamentButtonsStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor))
      constraints.append(tournamentButtonsStackView.leadingAnchor.constraint(equalTo: rulesTextView.leadingAnchor))
//        constraints.append(tournamentButtonsStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor))
        
        constraints.append(tournamentsTextView.topAnchor.constraint(equalTo: tournamentButtonsStackView.bottomAnchor, constant: 10))
//        constraints.append(tournamentsTextView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor))
        constraints.append(tournamentsTextView.leadingAnchor.constraint(equalTo: tournamentButtonsStackView.leadingAnchor))
        constraints.append(tournamentsTextView.bottomAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.bottomAnchor))
        
//        constraints.append(tournamentsTextView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor))

        
        
        
        
        
        
        
        
        
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func addValues(){
        
        historyTextView.text = "The History of chess \n \n The history of chess can be traced back nearly 1500 years to its earliest known predecessor, called chaturanga, in India; its prehistory is the subject of speculation. From India it spread to Persia. Following the Arab invasion and conquest of Persia, chess was taken up by the Muslim world and subsequently spread to Europe via Spain (Al Andalus) and Italy (Emirate of Sicily). The game evolved roughly into its current form by about 1500 CE.\"Romantic\" chess was the predominant playing style from the late 18th century to the 1880s. Chess games of this period emphasized quick, tactical maneuvers rather than long-term strategic planning. The Romantic era of play was followed by the Scientific, Hypermodern, and New Dynamism eras. In the second half of the 19th century, modern chess tournament play began, and the first official World Chess Championship was held in 1886. The 20th century saw great leaps forward in chess theory and the establishment of the World Chess Federation. In 1997, an IBM supercomputer beat Garry Kasparov, the then world chess champion, in the famous Deep Blue versus Garry Kasparov match, ushering the game into an era of computer domination. Since then, computer analysis – which originated in the 1970s with the first programmed chess games on the market – has contributed to much of the development in chess theory and has become an important part of preparation in professional human chess. Later developments in the 21st century made the use of computer analysis far surpassing the ability of any human player accessible to the public. Online chess, which first appeared in the mid-1990s, also became popular in the 21st century."
        
        rulesTextView.text = "The Rules of chess \n \n The rules of chess (also known as the laws of chess) govern the play of the game of chess. Chess is a two-player abstract strategy board game. Each player controls sixteen pieces of six types on a chessboard. Each type of piece moves in a distinct way. The object of the game is to checkmate (threaten with inescapable capture) the opponent's king. A game can end in various ways besides checkmate: a player can resign, and there are several ways a game can end in a draw. While the exact origins of chess are unclear, modern rules first took form during the Middle Ages. The rules continued to be slightly modified until the early 19th century, when they reached essentially their current form. The rules also varied somewhat from region to region. Today, the standard rules are set by FIDE (Fédération Internationale des Échecs), the international governing body for chess. Slight modifications are made by some national organizations for their own purposes. There are variations of the rules for fast chess, correspondence chess, online chess, and Chess960. Besides the basic moves of the pieces, rules also govern the equipment used, time control, conduct and ethics of players, accommodations for physically challenged players, and recording of moves using chess notation. Procedures for resolving irregularities that can occur during a game are provided as well."
        
        tournamentsTextView.text = "Past Tournaments \n Tata Steel 2023 "
        
    }
    @objc private func pastClicked(){
        tournamentsTextView.text = "Past Tournaments \n Tata Steel 2023 \n Lulin Chess 2023"
        
    }
    @objc private func futureClicked(){
        tournamentsTextView.text = "Future Tournaments \n Tata Steel 2024 \n Lulin Chess 2024"
        
    }
    @objc private func ongoingClicked(){
        tournamentsTextView.text = "Past Tournaments \n Tata Steel 2023 \n Lulin Chess 2023"
        
    }
    
    
    
}

extension UITextView{
    
    func setupInformationTextView() -> some UITextView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textAlignment = .left
        self.isScrollEnabled = false
        self.isEditable = false
        self.font = UIFont(name: "System", size: 16)
        //self.textColor = UIColor.blue
        self.backgroundColor = .systemBlue
        
        return self
    }
}
