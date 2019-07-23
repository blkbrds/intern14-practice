//
//  AppDelegate.swift
//  BaiTapNavigation
//
//  Created by PCI0013 on 7/10/19.
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
        window?.makeKeyAndVisible()
        
        movetoEx03()
        return true

    }
    
    func movetoProfile() {
        let vc = ProfileViewController()
        let navi = UINavigationController(rootViewController: vc)
        window?.rootViewController = navi
        
    }
    
    func movetoEx03() {
        let vc = HomeAvatarViewController()
        let navi = UINavigationController(rootViewController: vc)
        window?.rootViewController = navi
    }
    
    func movetoEx04() {
        let vc = NavigationBarBackGroundViewController()
        let navi = UINavigationController(rootViewController: vc)
        window?.rootViewController = navi
    }
    
    func moveToHome() {
        let vc = HomeViewController()
        let navi = UINavigationController(rootViewController: vc)
        window?.rootViewController = navi
    }
    
    func moveToLogin() {
        let vc = LoginViewController()
        let navi = UINavigationController(rootViewController: vc)
        window?.rootViewController = navi
    }
}

