//
//  ViewController.swift
//  netflix_clone
//
//  Created by Ciko Edo Febrian on 23/06/23.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc1.title = "Home"
        
        let vc2 = UINavigationController(rootViewController: SearchViewController())
        vc2.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc2.title = "Search"
        
        let vc3 = UINavigationController(rootViewController: ProfileViewController())
        vc3.tabBarItem.image = UIImage(systemName: "person")
        vc3.title = "Profile"
        
        
        
        tabBar.tintColor = .label
        setViewControllers([vc1, vc2, vc3], animated: true)
    }
    
}

