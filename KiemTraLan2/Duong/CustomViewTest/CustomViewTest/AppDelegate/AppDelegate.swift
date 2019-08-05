//
//  AppDelegate.swift
//  CustomViewTest
//
//  Created by Nguyen Duong on 8/5/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = MainViewController()
        if let window = window {
            window.rootViewController = vc
            window.makeKeyAndVisible()
        }
        return true
    }
}
