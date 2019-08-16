//
//  AppDelegate.swift
//  ExNavigation
//
//  Created by PCI0010 on 8/7/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var plistPathInDocument:String = String()
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let homeViewController = ExNaviViewController()
        let navigationController = UINavigationController(rootViewController: homeViewController)
        window?.rootViewController = navigationController
        
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        return true
    }
}

