//
//  UINavigationViewController.swift
//  RookScholar
//
//  Created by Danail Dimitrov on 4.05.23.
//

import UIKit

class UINavigationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func menuItemsSelected() {
        lazy var vc = ArticleTableViewController()
        //navigationController?.popToRootViewController(animated: true)
        navigationController?.pushViewController(vc, animated: true)
        print(12)
    }

}
