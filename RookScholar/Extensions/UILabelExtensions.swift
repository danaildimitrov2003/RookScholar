//
//  UILabelExtensions.swift
//  RookScholar
//
//  Created by Danail Dimitrov on 4.04.23.
//

import UIKit


extension UILabel{
    
    func setupInformationTitle() -> some UILabel{
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textAlignment = .left
        self.font = self.font.withSize(20)
        self.textColor = .init(named: "SecondaryColor")
        
        return self
    }
}

