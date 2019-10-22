//
//  MainPageViewController.swift
//  DatingMessenger
//
//  Created by MBA0051 on 10/21/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class MainPageViewController: UITabBarController, UITabBarControllerDelegate {

    var homeViewControllers: [UIViewController]?
    var itemController: TabBarItemController!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        // Add view controller.
        homeViewControllers = []
        homeViewControllers?.append(setViewControllerForTabBarItem(itemType: .Messages))
        homeViewControllers?.append(setViewControllerForTabBarItem(itemType: .Contacts))
        homeViewControllers?.append(setViewControllerForTabBarItem(itemType: .Schedules))
        homeViewControllers?.append(setViewControllerForTabBarItem(itemType: .MyPage))
        viewControllers = homeViewControllers
    }
}

private extension MainPageViewController {
    func setViewControllerForTabBarItem(itemType: TabBarItems) -> UIViewController {
        itemController = TabBarItemController(itemType: itemType)
        let viewController = UINavigationController(rootViewController: itemController.controller)
        itemController.controller.tabBarItem = UITabBarItem(title: itemType.rawValue, image: UIImage(named: itemController.imageDisabled )!.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named:itemController.imageEnbled))
        return viewController

    }
}
