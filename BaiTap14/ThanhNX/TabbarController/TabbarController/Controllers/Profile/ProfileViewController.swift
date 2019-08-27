//
//  ProfileViewController.swift
//  TabbarController
//
//  Created by PCI0008 on 8/22/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

class ProfileViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "PROFILE"
        
        let logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutButtonDidClick))
        navigationItem.leftBarButtonItem = logoutButton
    }
    
    @objc private func logoutButtonDidClick() {
        UIView.animate(withDuration: 0.3) {
            AppDelegate.shared.changeRoot(controller: .login, vc: self)
        }        
    }
}
