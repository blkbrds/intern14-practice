//
//  AppDelegate.swift
//  TabBarController
//
//  Created by Nguyen Duong on 8/22/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        let login = LoginViewController()
        let navigationController = UINavigationController(rootViewController: login)
        window?.rootViewController = navigationController
        return true
    }
}


// MARK: - Extension
extension AppDelegate {
    static var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    func switchToTabBarVC() {
        let home = HomeViewController()
        let homeNaviVC = UINavigationController(rootViewController: home)
        homeNaviVC.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "ic-home"), selectedImage: #imageLiteral(resourceName: "ic-home-selected"))
        
        let map = MapViewController()
        let mapNaviVC = UINavigationController(rootViewController: map)
        mapNaviVC.tabBarItem = UITabBarItem(title: "Map", image: #imageLiteral(resourceName: "ic-map"), selectedImage: #imageLiteral(resourceName: "ic-map-selected"))
        
        let favorites = FavoritesViewController()
        let favoritesNaviVC = UINavigationController(rootViewController: favorites)
        favoritesNaviVC.tabBarItem = UITabBarItem(title: "Favorites", image: #imageLiteral(resourceName: "ic-favorites"), selectedImage: #imageLiteral(resourceName: "ic-favorites-selected"))
        
        let profile = ProfileViewController()
        let profileNaviVC = UINavigationController(rootViewController: profile)
        profileNaviVC.tabBarItem = UITabBarItem(title: "Profile", image: #imageLiteral(resourceName: "ic-profile"), selectedImage: #imageLiteral(resourceName: "ic-profile-selected"))
        
        let viewControllers = [homeNaviVC, mapNaviVC, favoritesNaviVC, profileNaviVC]
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = viewControllers
        UITabBar.appearance()
        
        // Change root
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.window!.rootViewController = tabBarController
    }
    
    func switchToLoginVC() {
        let login = LoginViewController()
        let navigationController = UINavigationController(rootViewController: login)
        // Change root
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.window!.rootViewController = navigationController
    }
    
    //    func switchToVC(toRootVC: UIViewController) {
    //        let root = toRootVC
    //        let navigationController = UINavigationController(rootViewController: root)
    //        // Change root
    //
    //        let appdelegate = UIApplication.shared.delegate as! AppDelegate
    //        appdelegate.window!.rootViewController = navigationController
    //    }
    func switchToVC() {
        if UserDefaults.standard.bool(forKey: "LOGGED_IN") {
            switchToTabBarVC()
        } else {
            // navigate to login screen
            switchToLoginVC()
        }
    }
}
