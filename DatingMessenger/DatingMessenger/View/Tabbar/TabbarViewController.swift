//
//  TabbarViewController.swift
//  DatingMessenger
//
//  Created by MBA0051 on 10/22/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class TabbarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let messageHomeViewController = MessageHomeViewController()
        messageHomeViewController.viewModel = MessageViewModel()
        let messageNavi = UINavigationController(rootViewController: messageHomeViewController)
        messageNavi.tabBarItem = UITabBarItem(title: "Message home", image: UIImage(named: "favorite_selected" )!.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "favorite"))
        
        let contactHomeViewController = ContactHomeViewController()
        let contactNavi = UINavigationController(rootViewController: contactHomeViewController)
        contactNavi.tabBarItem = UITabBarItem(title: "Contact home", image: UIImage(named: "home_selected" )!.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "home"))

        let scheduleHomeViewController = ScheduleHomeViewController()
        scheduleHomeViewController.viewModel = ScheduleHomeViewModel()
        let scheduleNavi = UINavigationController(rootViewController: scheduleHomeViewController)
        scheduleNavi.tabBarItem = UITabBarItem(title: "Schedule home", image: UIImage(named: "map_selected" )!.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "map"))
        
        let myPageViewController = MapDetailViewController()
        let mypageNavi = UINavigationController(rootViewController: myPageViewController)
        mypageNavi.tabBarItem = UITabBarItem(title: "Mypage home", image: UIImage(named: "profile_selected" )!.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "profile"))
        
        viewControllers = [messageNavi, contactNavi, scheduleNavi, mypageNavi]
    }
}
