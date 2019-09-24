//
//  AppDelegate.swift
//  Navigation
//
//  Created by MBA0217 on 9/19/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let rootController = HomeController()
        let navigationController = UINavigationController(rootViewController: rootController)
        window?.rootViewController = navigationController
        
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        return true
    }


}

