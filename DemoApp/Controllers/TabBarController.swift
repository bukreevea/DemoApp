//
//  ViewController.swift
//  DemoApp
//
//  Created by Eugene on 25.07.2024.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setUp()
    }
    
    func setUp() {
        let breedsVC = BreedsViewController()
        setViewControllers([breedsVC], animated: true)
    }
}
