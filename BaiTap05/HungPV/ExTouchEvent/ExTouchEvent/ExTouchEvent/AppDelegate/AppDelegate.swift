//
//  AppDelegate.swift
//  ExTouchEvent
//
//  Created by PCI0010 on 8/15/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let homeViewController = HomeViewController()
        let touchEventController = UINavigationController(rootViewController: homeViewController)
        window?.rootViewController = touchEventController
        
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        return true
    }



}

