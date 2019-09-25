//
//  AppDelegate.swift
//  BaiTap2API
//
//  Created by Nguyen Duong on 8/23/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()

        let vc = TopAudioBooksViewController()
        let navigationController = UINavigationController(rootViewController: vc)
        window?.rootViewController = navigationController
        return true
    }
}
