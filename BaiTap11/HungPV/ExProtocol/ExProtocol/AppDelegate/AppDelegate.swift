//
//  AppDelegate.swift
//  ExProtocol
//
//  Created by PCI0010 on 9/4/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let homeViewController = HomeViewController()
        let exController = UINavigationController(rootViewController: homeViewController)
        window?.rootViewController = exController
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        return true
    }
}

