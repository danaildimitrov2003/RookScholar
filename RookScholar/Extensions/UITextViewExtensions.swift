//
//  UITextViewExtensions.swift
//  RookScholar
//
//  Created by Danail Dimitrov on 4.04.23.
//

import UIKit

extension UITextView{
    
    func setupInformationTextView() -> some UITextView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textAlignment = .left
        self.isScrollEnabled = false
        self.isEditable = false
        self.font = UIFont(name: "System", size: 16)
        self.textColor = .init(named: "SecondaryColor")
        self.backgroundColor = .init(named: "MainColor")
        
        return self
    }
}
