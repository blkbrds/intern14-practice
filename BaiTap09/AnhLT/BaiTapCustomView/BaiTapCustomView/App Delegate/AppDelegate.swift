//
//  AppDelegate.swift
//  BaiTapCustomView
//
//  Created by PCI0013 on 7/23/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    static let shared: AppDelegate = {
        guard let shared = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Can not get appdelegate")
        }
        return shared
    }()
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        configRootView(vc: DatePickerViewController())
        window?.makeKeyAndVisible()
    
        return true
    }
}

// MARK: - Config root view
extension AppDelegate {
    private func configRootView(vc: UIViewController) {
        let navi = UINavigationController(rootViewController: vc)
        window?.rootViewController = navi
    }
}
