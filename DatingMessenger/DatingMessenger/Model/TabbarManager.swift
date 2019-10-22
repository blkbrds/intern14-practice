//
//  TabbarManager.swift
//  DatingMessenger
//
//  Created by MBA0051 on 10/22/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class TabbarManager {

    class func getData(completion: ([UIViewController]) -> Void) {
        
        let messageViewController = UINavigationController(rootViewController: MessageHomeViewController())
        messageViewController.tabBarItem = UITabBarItem(title: "Message home", image: UIImage(named: "favorite_selected" )!.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "favorite"))
        
        let contactViewController = UINavigationController(rootViewController: ContactHomeViewController())
        contactViewController.tabBarItem = UITabBarItem(title: "Contact home", image: UIImage(named: "home_selected" )!.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "home"))

        let scheduleViewController = UINavigationController(rootViewController: ScheduleHomeViewController())
        scheduleViewController.tabBarItem = UITabBarItem(title: "Schedule home", image: UIImage(named: "map_selected" )!.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "map"))
        
        let mypageViewController = UINavigationController(rootViewController: MyPageViewController())
        scheduleViewController.tabBarItem = UITabBarItem(title: "Mypage home", image: UIImage(named: "profile_selected" )!.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "profile"))
        
        completion([messageViewController,
        contactViewController, scheduleViewController, mypageViewController])
    }
}
