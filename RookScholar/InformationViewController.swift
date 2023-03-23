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
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    var stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        return stackView
    }()
    var textView: UITextView = {
       var textView = UITextView()
        
        textView = textView.setupInformationTextView()
        
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    private func setupUI(){
        var constraints = [NSLayoutConstraint]()
        textView.text = "fdfsdfsdfdgvfsgbdfbgfsbgfb"
        view.addSubview(scrollView)
        scrollView.addSubview(textView)
        constraints.append(scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        
        constraints.append(textView.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor))
        constraints.append(textView.bottomAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(textView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(textView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor))
        
        
        
        
        NSLayoutConstraint.activate(constraints)
    }
   
}
extension UITextView{
    
    func setupInformationTextView() -> some UITextView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textAlignment = .left
        self.isScrollEnabled = false
        self.isEditable = false
        self.font = UIFont(name: "System", size: 16)
        self.textColor = UIColor.blue
        
        return self
    }
}
