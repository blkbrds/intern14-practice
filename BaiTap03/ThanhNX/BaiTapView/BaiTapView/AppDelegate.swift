//
//  AppDelegate.swift
//  BaiTapView
//
//  Created by PCI0008 on 6/17/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window =  UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        let bai1ViewController = Bai3ViewController()
        window?.rootViewController = bai1ViewController
        
        return true
    }
}

