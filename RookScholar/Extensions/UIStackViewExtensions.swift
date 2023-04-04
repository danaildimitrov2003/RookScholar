//
//  UIStackViewExtensions.swift
//  RookScholar
//
//  Created by Danail Dimitrov on 4.04.23.
//

import UIKit

extension UIStackView{
    
    func setupInformationStackView() -> some UIStackView{
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .vertical
        self.distribution = .fillProportionally
        self.spacing = 5
        self.backgroundColor = .init(named: "MainColor")
        self.layer.cornerRadius = 10
        return self
    }
}
