//
//  AppDelegate.swift
//  btView1
//
//  Created by PCI0010 on 7/18/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        let baiTap5ViewController = BaiTap5ViewController()
        window?.rootViewController = baiTap5ViewController
        return true
    }
}
