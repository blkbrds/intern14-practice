//
//  ProfileViewController.swift
//  ExTabbar
//
//  Created by PCI0010 on 9/10/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = " Profile "
    }

    @IBAction func logOutButton(_ sender: Any) {
        AppDelegate.shared.pushViewController(controllers: .login)
    }
}
