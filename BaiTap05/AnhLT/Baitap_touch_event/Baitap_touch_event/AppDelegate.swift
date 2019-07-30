//
//  AppDelegate.swift
//  Baitap_touch_event
//
//  Created by PCI0013 on 7/1/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        let homeViewController = Ex05ViewController()
        window?.rootViewController = homeViewController
        return true
    }
}
