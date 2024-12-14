//
//  MainViewController.swift
//  ShouldI
//
//  Created by Luis Gonzalez on 12/13/24.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    func configure() {
        let mainViewController = HomeViewController()
        let profileViewController = ProfileViewController()
        
        
        mainViewController.tabBarItem.image = UIImage(systemName: "person.fill.questionmark")
        mainViewController.tabBarItem.title = "Ask"
        
        profileViewController.tabBarItem.image = UIImage(systemName: "clock.fill")
        profileViewController.tabBarItem.title = "History"
        
        mainViewController.title = "Ask Me"
        profileViewController.title = "Your History"
        
        let vc1 = UINavigationController(rootViewController: mainViewController)
        let vc2 = UINavigationController(rootViewController: profileViewController)
        
        setViewControllers([vc1, vc2], animated: true)
        
        tabBar.tintColor = .label
        tabBar.barTintColor = .systemBackground
    }
    
}
