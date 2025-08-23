//
//  TabBarController.swift
//  practice-uikit-webdmitriev
//
//  Created by Олег Дмитриев on 23.08.2025.
//

import UIKit

final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.tintColor = .black
        self.tabBar.backgroundColor = .white
        self.tabBar.unselectedItemTintColor = .lightGray
        
        setupTabs()
    }
    
    // Methods
    private func setupTabs() {
        let homeVC = self.createNavBar("Home", image: UIImage(systemName: "house"), vc: Builder.createHomeViewController())
        let odVC = self.createNavBar("OD", image: UIImage(systemName: "tablecells"), vc: Builder.createODTableView())
        
        self.setViewControllers([homeVC, odVC], animated: true)
    }
    
    private func createNavBar(_ title: String, image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        return nav
    }
    
}
