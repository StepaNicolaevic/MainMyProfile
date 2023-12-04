//
//  ViewController.swift
//  TestovoeZadanie
//
//  Created by qeqwe on 26.11.2023.
//

import UIKit

final class ViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    private func setupUI() {
    
        let episodesVC = EpisodesNavViewController()
        let favouritesVC = FavouritesNavViewController()
        let episodesNavController = UINavigationController(rootViewController: episodesVC)
        let favouritesNavController = UINavigationController(rootViewController: favouritesVC)
        
        
        episodesNavController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Home"), tag: 0)
        episodesNavController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 119, bottom: 0, right: 0)
        favouritesNavController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Vector"), tag: 1)
        favouritesNavController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 119)
         setViewControllers([episodesNavController, favouritesNavController], animated: true)
        
    }
}

