//
//  AppDelegate.swift
//  UINavigation
//
//  Created by PCI0007 on 7/9/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let handle = HandlePlist()
    var plistInDocument: String = ""
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let vc = HomePageViewController()
        let navigationController = UINavigationController(rootViewController: vc)
        
        window?.rootViewController = navigationController
        
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
//        prepareForUse(filename: "userPlist")
        HandlePlist.shared.prepareForUse(filename: "ex03User")
    }
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
//        prepareForUse(filename: "userPlist")
        HandlePlist.shared.prepareForUse(filename: "ex03User")
    }
    
//    func prepareForUse(filename: String) {
//        let rootPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
//        plistInDocument = rootPath.appending("\(filename).plist")
//        let fileManager = FileManager.default
//        if !fileManager.fileExists(atPath: plistInDocument) {
//            guard let plistInBundle = Bundle.main.path(forResource: filename, ofType: "plist") else { return }
//            do {
//                try FileManager.default.copyItem(atPath: plistInBundle, toPath: plistInDocument)
//            } catch {
//                print("ERROR")
//            }
//        }
//    }

    

    

}






