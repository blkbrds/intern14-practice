//
//  AppDelegate.swift
//  Baitap-Outlet-Action
//
//  Created by MBA0217 on 8/16/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        let homeViewController = Ex04ViewController()
        window?.rootViewController = homeViewController
        return true
    }

}

