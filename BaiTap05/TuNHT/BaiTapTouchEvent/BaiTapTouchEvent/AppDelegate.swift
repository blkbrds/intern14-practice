//
//  AppDelegate.swift
//  BaiTapTouchEvent
//
//  Created by PCI0001 on 6/28/19.
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
        
        let baiTap = BaiTap1()
        window?.rootViewController = baiTap
        
        return true
    }
}

