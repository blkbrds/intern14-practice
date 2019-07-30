//
//  AppDelegate.swift
//  MVC
//
//  Created by PCI0007 on 7/4/19.
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
        let homeViewController = CalculatorViewController()
        window?.rootViewController = homeViewController
        return true
    }
}

