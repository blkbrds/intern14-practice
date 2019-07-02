//
//  AppDelegate.swift
//  BaiTap2
//
//  Created by Nguyen Duong on 6/27/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        if let window = window {
            window.backgroundColor = .white
            window.makeKeyAndVisible()
            let viewController = SliderViewController()
            window.rootViewController = viewController
        }
        return true
    }
}

