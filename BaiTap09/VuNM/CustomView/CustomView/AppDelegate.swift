//
//  AppDelegate.swift
//  CustomView
//
//  Created by PCI0007 on 8/2/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let handle = HandlePlist()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        let vc = HomePageViewController()
        let navi = UINavigationController(rootViewController: vc)
        window?.rootViewController = navi
        
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        HandlePlist.shared.prepareForUse(filename: "userPlist")
    }
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        HandlePlist.shared.prepareForUse(filename: "userPlist")
    }

}

