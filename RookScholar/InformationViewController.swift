//
//  InformationViewController.swift
//  RookScholar
//
//  Created by Danail Dimitrov on 23.03.23.
//

import UIKit
import WebKit
import SideMenu

class InformationViewController: UIViewController{
  
    private var sideMenu: SideMenuNavigationController?
    
    var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
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
    
    var historyStackView: UIStackView = {
        var stackView = UIStackView()
        stackView = stackView.setupInformationStackView()
        return stackView
    }()
    
    var rulesStackView: UIStackView = {
        var stackView = UIStackView()
        stackView = stackView.setupInformationStackView()
        return stackView
    }()
    
    var tournamentsStackView: UIStackView = {
        var stackView = UIStackView()
        stackView = stackView.setupInformationStackView()
        return stackView
    }()
    
    let historyTitle : UILabel = {
        var informationTitle = UILabel()
        informationTitle = informationTitle.setupInformationTitle()
        informationTitle.text = "The History of chess ♟️"
        return informationTitle
    }()
    
    let rulesTitle : UILabel = {
        var informationTitle = UILabel()
        informationTitle = informationTitle.setupInformationTitle()
        informationTitle.text = "The Rules of chess 📃"
        return informationTitle
    }()
    
    let tournamentsTitle : UILabel = {
        var informationTitle = UILabel()
        informationTitle = informationTitle.setupInformationTitle()
        informationTitle.text = "Tournaments 🏆"
        return informationTitle
    }()
    
    var tournamentsButtonsStackView: UIStackView = {
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
        //uiButton.backgroundColor = .orange
        uiButton.setTitleColor(.init(named: "SelectedTournamentsColor"), for: .normal)
        uiButton.translatesAutoresizingMaskIntoConstraints = false
        return uiButton
    }()
    
    var futureButton: UIButton = {
        let uiButton = UIButton()
        uiButton.setTitle("Future", for: .normal)
        //uiButton.backgroundColor = .blue
        uiButton.setTitleColor(.init(named: "FutureTournamentsColor"), for: .normal)
        uiButton.translatesAutoresizingMaskIntoConstraints = false
        return uiButton
    }()
    
    var ongoingButton: UIButton = {
        let uiButton = UIButton()
        uiButton.setTitle("Ongoing", for: .normal)
        //uiButton.backgroundColor = .green
        uiButton.setTitleColor(.init(named: "OnGoingTournamentsColor"), for: .normal)
        uiButton.translatesAutoresizingMaskIntoConstraints = false
        return uiButton
    }()
    
    var tournamentsScheduleButton: UIButton = {
        let uiButton = UIButton()
        uiButton.setTitle("View tournament schedule", for: .normal)
        uiButton.backgroundColor = .init(named: "AccentColor")
        uiButton.layer.cornerRadius = 10
        uiButton.setTitleColor(.init(named: "SecondaryColor"), for: .normal)
        uiButton.translatesAutoresizingMaskIntoConstraints = false
        
        uiButton.isHidden = true
        return uiButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addValues()
        setupUI()
        addSideMenu()
        
    }
    
    @IBAction func didTabMenuButton() {
        guard let sideMenuChecked = sideMenu else{
            return
        }
        present(sideMenuChecked , animated: true)
    }
    
    
    
    private func setupUI(){
        pastButton.addTarget(self, action:#selector(self.pastClicked), for: .touchUpInside)
        futureButton.addTarget(self, action:#selector(self.futureClicked), for: .touchUpInside)
        ongoingButton.addTarget(self, action:#selector(self.ongoingClicked), for: .touchUpInside)
        tournamentsScheduleButton.addTarget(self, action:#selector(self.scheduleButtonClicked), for: .touchUpInside)
        var constraints = [NSLayoutConstraint]()
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(historyStackView)
        scrollView.addSubview(rulesStackView)
        scrollView.addSubview(tournamentsStackView)
        
        historyStackView.addArrangedSubview(historyTitle)
        historyStackView.addArrangedSubview(historyTextView)
        
        rulesStackView.addArrangedSubview(rulesTitle)
        rulesStackView.addArrangedSubview(rulesTextView)
        
        tournamentsStackView.addArrangedSubview(tournamentsTitle)
        tournamentsStackView.addArrangedSubview(tournamentsButtonsStackView)
        tournamentsStackView.addArrangedSubview(tournamentsTextView)
        tournamentsStackView.addArrangedSubview(tournamentsScheduleButton)
        
        
        tournamentsButtonsStackView.addArrangedSubview(pastButton)
        tournamentsButtonsStackView.addArrangedSubview(futureButton)
        tournamentsButtonsStackView.addArrangedSubview(ongoingButton)
        
        
        
        
        constraints.append(scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        
        
        constraints.append(historyStackView.topAnchor.constraint(equalTo: scrollView.topAnchor))
        constraints.append(historyStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor))
        constraints.append(historyStackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor))
        
        constraints.append(historyTitle.leadingAnchor.constraint(equalTo: historyStackView.leadingAnchor, constant: 10))
        constraints.append(historyTextView.leadingAnchor.constraint(equalTo: historyStackView.leadingAnchor, constant: 10))
        constraints.append(historyTextView.trailingAnchor.constraint(equalTo: historyStackView.trailingAnchor, constant: -10))
        
        constraints.append(rulesStackView.topAnchor.constraint(equalTo: historyStackView.bottomAnchor, constant: 10))
        constraints.append(rulesStackView.leadingAnchor.constraint(equalTo: historyStackView.leadingAnchor))
        constraints.append(rulesStackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor ))
        
        constraints.append(rulesTitle.leadingAnchor.constraint(equalTo: rulesStackView.leadingAnchor, constant: 10))
        
        constraints.append(rulesTextView.leadingAnchor.constraint(equalTo: rulesStackView.leadingAnchor, constant: 10))
        constraints.append(rulesTextView.trailingAnchor.constraint(equalTo: rulesStackView.trailingAnchor, constant: -10))
        
        constraints.append(tournamentsStackView.topAnchor.constraint(equalTo: rulesStackView.bottomAnchor, constant: 10))
        constraints.append(tournamentsStackView.leadingAnchor.constraint(equalTo: rulesStackView.leadingAnchor))
        constraints.append(tournamentsTextView.topAnchor.constraint(equalTo: tournamentsButtonsStackView.bottomAnchor, constant: 10))
        constraints.append(tournamentsStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor))
        constraints.append(tournamentsStackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor ))
        
        constraints.append(tournamentsTitle.leadingAnchor.constraint(equalTo: tournamentsStackView.leadingAnchor, constant: 10))
        
        constraints.append(tournamentsButtonsStackView.leadingAnchor.constraint(equalTo: tournamentsStackView.leadingAnchor, constant: 10))
        
        constraints.append(tournamentsTextView.leadingAnchor.constraint(equalTo: tournamentsStackView.leadingAnchor, constant: 10))
        constraints.append(tournamentsTextView.trailingAnchor.constraint(equalTo: tournamentsStackView.trailingAnchor, constant: -10))
        constraints.append(tournamentsScheduleButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor))
        
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func addValues(){
        
        
        
        historyTextView.text = "The history of chess can be traced back nearly 1500 years to its earliest known predecessor, called chaturanga, in India; its prehistory is the subject of speculation. From India it spread to Persia. Following the Arab invasion and conquest of Persia, chess was taken up by the Muslim world and subsequently spread to Europe via Spain (Al Andalus) and Italy (Emirate of Sicily). The game evolved roughly into its current form by about 1500 CE.\"Romantic\" chess was the predominant playing style from the late 18th century to the 1880s. Chess games of this period emphasized quick, tactical maneuvers rather than long-term strategic planning. The Romantic era of play was followed by the Scientific, Hypermodern, and New Dynamism eras. In the second half of the 19th century, modern chess tournament play began, and the first official World Chess Championship was held in 1886. The 20th century saw great leaps forward in chess theory and the establishment of the World Chess Federation. In 1997, an IBM supercomputer beat Garry Kasparov, the then world chess champion, in the famous Deep Blue versus Garry Kasparov match, ushering the game into an era of computer domination. Since then, computer analysis – which originated in the 1970s with the first programmed chess games on the market – has contributed to much of the development in chess theory and has become an important part of preparation in professional human chess. Later developments in the 21st century made the use of computer analysis far surpassing the ability of any human player accessible to the public. Online chess, which first appeared in the mid-1990s, also became popular in the 21st century.\n \n"
        
        rulesTextView.text = "The rules of chess (also known as the laws of chess) govern the play of the game of chess. Chess is a two-player abstract strategy board game. Each player controls sixteen pieces of six types on a chessboard. Each type of piece moves in a distinct way. The object of the game is to checkmate (threaten with inescapable capture) the opponent's king. A game can end in various ways besides checkmate: a player can resign, and there are several ways a game can end in a draw. While the exact origins of chess are unclear, modern rules first took form during the Middle Ages. The rules continued to be slightly modified until the early 19th century, when they reached essentially their current form. The rules also varied somewhat from region to region. Today, the standard rules are set by FIDE (Fédération Internationale des Échecs), the international governing body for chess. Slight modifications are made by some national organizations for their own purposes. There are variations of the rules for fast chess, correspondence chess, online chess, and Chess960. Besides the basic moves of the pieces, rules also govern the equipment used, time control, conduct and ethics of players, accommodations for physically challenged players, and recording of moves using chess notation. Procedures for resolving irregularities that can occur during a game are provided as well.\n"
        
        getPastTournamentsText()
        
    }
    
    private func addSideMenu() {
        let menu = MenuController(with: ["Articles", "Info"])
        menu.delegate = self
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        sideMenu?.leftSide = false
        SideMenuManager.default.rightMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
    }
    
    private func getPastTournamentsText(){
        tournamentsTextView.text = "Past Tournaments \n"
        for tournament in pastTournaments{
            tournamentsTextView.text += "\n\n\(tournament.title), \(tournament.startDate)-\(tournament.endDate),📍\(tournament.venue) | \(tournament.city) | \(tournament.countryCode)"
            
        }
    }
    
    private func getFutureTournamentsText(){
        tournamentsTextView.text = "Future Tournaments \n"
        for tournament in futureTournaments{
            tournamentsTextView.text += "\n\n\(tournament.title), \(tournament.startDate)-\(tournament.endDate),📍\(tournament.venue) | \(tournament.city) | \(tournament.countryCode)‎‎‏‏‎"
            
        }
    }
    
    private func getOngoingTournamentsText(){
        tournamentsTextView.text = "Ongoing Tournaments \n"
        for tournament in ongoingTournaments{
            tournamentsTextView.text += "\n\n\(tournament.title), \(tournament.startDate)-\(tournament.endDate),📍\(tournament.venue) | \(tournament.city) | \(tournament.countryCode)‎‎‏‏‎"
            
        }
    }
    
    @objc private func pastClicked(){
        pastButton.setTitleColor(.init(named: "SelectedTournamentsColor"), for: .normal)
        futureButton.setTitleColor(.init(named: "FutureTournamentsColor"), for: .normal)
        ongoingButton.setTitleColor(.init(named: "OnGoingTournamentsColor"), for: .normal)
        tournamentsScheduleButton.isHidden = true
        getPastTournamentsText()
        
    }
    
    @objc private func futureClicked(){
        pastButton.setTitleColor(.init(named: "PastTournamentsColor"), for: .normal)
        futureButton.setTitleColor(.init(named: "SelectedTournamentsColor"), for: .normal)
        ongoingButton.setTitleColor(.init(named: "OnGoingTournamentsColor"), for: .normal)
        tournamentsScheduleButton.isHidden = true
        getFutureTournamentsText()
    }
    
    @objc private func ongoingClicked(){
        pastButton.setTitleColor(.init(named: "PastTournamentsColor"), for: .normal)
        futureButton.setTitleColor(.init(named: "FutureTournamentsColor"), for: .normal)
        ongoingButton.setTitleColor(.init(named: "SelectedTournamentsColor"), for: .normal)
        tournamentsScheduleButton.isHidden = false
        getOngoingTournamentsText()
    }
    
    @objc private func scheduleButtonClicked(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        lazy var ScheduleView = storyBoard.instantiateViewController(withIdentifier: "ScheduleView") as! ScheduleViewController
        self.navigationController?.pushViewController(ScheduleView, animated: true)

    }
    
}

extension InformationViewController : MenuControllerDelegate{
    
    func didSelectMenuItem(named: String) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        sideMenu?.dismiss(animated: true, completion: {
            switch named {
                case "Articles":
                    lazy var ArticleTable = storyBoard.instantiateViewController(withIdentifier: "ArticleTable") as! ArticleTableViewController
                    self.navigationController?.pushViewController(ArticleTable, animated: true)
                case "Info":
                    lazy var InformationView = storyBoard.instantiateViewController(withIdentifier: "InformationView") as! InformationViewController
                    self.navigationController?.pushViewController(InformationView, animated: true)
                
            default:
                print(" ")
            }
        })
    }
}





