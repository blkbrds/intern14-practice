//
//  IndexPageViewController.swift
//  CustomTabBar
//
//  Created by MBA0051 on 10/17/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class IndexPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func homePageButtonClick(_ sender: UIButton) {

        // Create tabbar.
        let homePage = UINavigationController(rootViewController: HomePageViewController())

        homePage.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home.png"), selectedImage: UIImage(named: "home_selected.png"))

        let mapPage = UINavigationController(rootViewController: MapPageViewController())
        mapPage.tabBarItem = UITabBarItem(title: "Map", image: UIImage(named: "map.png"), selectedImage: UIImage(named: "map_selected.png"))

        let favoritesPage = UINavigationController(rootViewController: FavoritesPageViewController())
        favoritesPage.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(named: "favorite.png"), selectedImage: UIImage(named: "favorite_selected.png"))
        
        let profilePage = UINavigationController(rootViewController: ProfilePageViewController())
        profilePage.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profile.png"), selectedImage: UIImage(named: "profile_selected.png"))
        
        let viewControllers = [homePage, mapPage, favoritesPage, profilePage]
        let tabbar = UITabBarController()
        tabbar.viewControllers = viewControllers
        
        // Change root controller.
        UIApplication.shared.windows.filter{$0.isKeyWindow}.first?.rootViewController = tabbar
    }
}
