//
//  AppDelegate.swift
//  test2
//
//  Created by PCI0007 on 8/5/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        let vc = InfoViewController()
        let navi = UINavigationController(rootViewController: vc)
        window?.rootViewController = navi
        
        return true
    }

}

