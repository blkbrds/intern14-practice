//
//  AppDelegate.swift
//  TabbarController
//
//  Created by PCI0008 on 8/22/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    //Singleton
    static let shared: AppDelegate = {
        guard let shared = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Cannot cast `UIApplication.shared.delegate` to `AppDelegate`.")
        }
        return shared
    }()
    
    let loginVC = LoginViewController()
    let tabBarController = UITabBarController()
    
    enum ViewController {
        case login
        case tabbar
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool { 
        
        //Config Window
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: loginVC)
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func changeRoot(controller: ViewController, vc: UIViewController) {
        switch controller {
        case .login:
            vc.view.window?.rootViewController = UINavigationController(rootViewController: loginVC)
        case .tabbar:
            //Config tab Home
            let homeViewController = HomeViewController()
            let homeNavigationController = UINavigationController(rootViewController: homeViewController)
            homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "ic-home"), selectedImage: #imageLiteral(resourceName: "ic-home-selected"))
            homeNavigationController.tabBarItem.tag = 0
            
            //Config tab Map
            let mapViewController = MapViewController()
            let mapNavigationController = UINavigationController(rootViewController: mapViewController)
            mapNavigationController.tabBarItem = UITabBarItem(title: "Map", image: #imageLiteral(resourceName: "ic-map"), selectedImage: #imageLiteral(resourceName: "ic-map-selected"))
            mapNavigationController.tabBarItem.tag = 1
            
            //Config tab Favorites
            let favoritesViewController = FavoritesViewController()
            let favoritesNavigationController = UINavigationController(rootViewController: favoritesViewController)
            favoritesNavigationController.tabBarItem = UITabBarItem(title: "Favorites", image: #imageLiteral(resourceName: "ic-favorites"), selectedImage: #imageLiteral(resourceName: "ic-favorites-selected"))
            favoritesNavigationController.tabBarItem.tag = 2
            
            //Config tab Profile
            let profileViewController = ProfileViewController()
            let profileNavigationController = UINavigationController(rootViewController: profileViewController)
            profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: #imageLiteral(resourceName: "ic-profile"), selectedImage: #imageLiteral(resourceName: "ic-profile-selected"))
            profileNavigationController.tabBarItem.tag = 3
            
            //Config viewControllers
            let viewControllers = [homeNavigationController, mapNavigationController, favoritesNavigationController, profileNavigationController]
            tabBarController.viewControllers = viewControllers
            vc.view.window?.rootViewController = tabBarController
        }
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}
}
