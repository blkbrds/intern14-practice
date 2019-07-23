//
//  HomeViewController.swift
//  BaiTapNavigation
//
//  Created by PCI0013 on 7/10/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var isFirstRun = UserDefaults.standard.bool(forKey: "firstRun")
    var username: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Home"
        nameLabel.text = username
        
        let logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(backToLoginScreen))
        navigationItem.leftBarButtonItem = logoutButton
        
        let editButton = UIBarButtonItem(title: "Edit", style: .done, target: self, action: #selector(moveToEdit))
        navigationItem.rightBarButtonItem = editButton
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        if !isFirstRun {
            nameLabel.text = UserDefaults.standard.string(forKey: "username")
            guard let userss = UserDefaults.standard.string(forKey: "username") else { return }
            username = userss
        }
    }
    
    @objc func backToLoginScreen() {
        AppDelegate.shared.moveToLogin()
    }
    
    @objc func moveToEdit() {
        let vc = EditViewController()
        vc.username = self.username
        navigationController?.pushViewController(vc, animated: true)
    }
}
