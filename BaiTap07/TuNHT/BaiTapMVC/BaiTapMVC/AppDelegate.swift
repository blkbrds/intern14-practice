//
//  AppDelegate.swift
//  BaiTapMVC
//
//  Created by PCI0001 on 7/3/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        let baiTap = Calculator()
        window?.rootViewController = baiTap
        
        return true
    }
}

