//
//  AppDelegate.swift
//  Touch-Event
//
//  Created by MBA0217 on 8/22/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        let controller = Ex03ViewController()
        window?.rootViewController = controller
        return true
    }

}

