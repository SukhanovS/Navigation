//
//  TabbarControler.swift
//  Navigation
//
//  Created by Stas Sukhanov on 15.08.2022.
//

import UIKit

class TabBarController: UITabBarController {
    
    var firstTabNavigationController : UINavigationController!
    var secondTabNavigationControoller : UINavigationController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        firstTabNavigationController = UINavigationController.init(rootViewController: FeedViewController())
        secondTabNavigationControoller = UINavigationController.init(rootViewController: LoginViewController())
        
        self.viewControllers = [firstTabNavigationController, secondTabNavigationControoller]
        
        let item1 = UITabBarItem(title: "Лента", image: UIImage(systemName: "bubble.left.circle"), tag: 0)
        
        let item2 = UITabBarItem(title: "Профиль", image:  UIImage(systemName: "person.circle"), tag: 1)
        
        firstTabNavigationController.tabBarItem = item1
        secondTabNavigationControoller.tabBarItem = item2
        
        UITabBar.appearance().tintColor = .systemBlue
        UITabBar.appearance().backgroundColor = .secondarySystemBackground
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
