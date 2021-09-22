//
//  NavigationViewController.swift
//  BoredApp
//
//  Created by Gleb Tregubov on 21.09.2021.
//

import UIKit

class NavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.prefersLargeTitles = true
        navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "Nunito-ExtraBold", size: 36.0)!
        ]
        
        navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "Nunito-ExtraBold", size: 24.0)!
        ]
    }
    

}
