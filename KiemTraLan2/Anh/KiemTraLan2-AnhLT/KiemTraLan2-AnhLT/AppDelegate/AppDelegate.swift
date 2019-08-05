//
//  AppDelegate.swift
//  KiemTraLan2-AnhLT
//
//  Created by PCI0013 on 8/5/19.
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
        
        let kiemTra = PopUpViewController()
        window?.rootViewController = kiemTra
        return true
    }
}

