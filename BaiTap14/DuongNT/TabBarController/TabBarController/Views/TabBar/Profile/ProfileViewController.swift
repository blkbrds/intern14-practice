//
//  ProfileViewController.swift
//  TabBarController
//
//  Created by Nguyen Duong on 8/22/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logOutButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(logOut))
        navigationItem.rightBarButtonItem = logOutButtonItem
    }

    @objc private func logOut() {
        UserDefaults.standard.set(false, forKey: "LOGGED_IN")
        AppDelegate.shared.switchToVC()
    }
}
