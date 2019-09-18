//
//  AppDelegate.swift
//  ExTabbar
//
//  Created by PCI0010 on 9/9/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    public static var shared: AppDelegate = {
        guard let shared = UIApplication.shared.delegate as? AppDelegate else { fatalError()
        }
        return shared
    }()
    
    var window: UIWindow?
    
    enum ViewControllers {
        case login
        case tabBar
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //Config : - Window
        window = UIWindow(frame: UIScreen.main.bounds)
        pushViewController(controllers: .login)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func pushViewController(controllers: ViewControllers) {
        switch controllers {
        case .login :
            let vc = LoginViewController()
            window?.rootViewController = UINavigationController(rootViewController: vc)
        case .tabBar:
            //Config : - Tab Home
            let homeViewController = HomeViewController()
            let homeNavigationController = UINavigationController(rootViewController: homeViewController)
            homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "ic-home-white"), tag: 0)
            
            //Config : - Tab Map
            let mapViewController = MapViewController()
            let mapNavigationController = UINavigationController(rootViewController: mapViewController)
            mapNavigationController.tabBarItem = UITabBarItem(title: "Map", image: #imageLiteral(resourceName: "ic-map-white"), tag: 1)
            
            //Config : - Tab Favorite
            let favoriteViewController = FavoriteViewController()
            let favoriteNavigationController = UINavigationController(rootViewController: favoriteViewController)
            favoriteNavigationController.tabBarItem = UITabBarItem(title: "Favorite", image: #imageLiteral(resourceName: "ic-favorite-white"), tag: 2)
            
            //Config : - Tab Profile
            let profileViewController = ProfileViewController()
            let profileNavigationController = UINavigationController(rootViewController: profileViewController)
            profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: #imageLiteral(resourceName: "ic-profile-white"), tag: 3)
            
            let viewControllers = [homeNavigationController, mapNavigationController, favoriteNavigationController, profileNavigationController]
            let tabBarController = UITabBarController()
            tabBarController.viewControllers = viewControllers
            window?.rootViewController = tabBarController
        }
    }
    
}

