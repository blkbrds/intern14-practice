//
//  Bai2HomeViewController.swift
//  BaiTapNavigation
//
//  Created by PCI0001 on 7/10/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class Bai2HomeViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    var user: UserData = UserData()
    var isFirstRun = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        welcomeLabel.text = "Welcome\n\(user.username)"
        
        let logoutBarButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logout))
        navigationItem.leftBarButtonItem = logoutBarButton
        
        let editBarButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(edit))
        navigationItem.rightBarButtonItem = editBarButton
    }
    
    @objc func logout() {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if isFirstRun {
            isFirstRun = false
        } else {
            user.username = UserDefaults.standard.string(forKey: "username")!
            welcomeLabel.text = "Welcome\n\(user.username)"
        }
    }
    
    @objc func edit() {
        let viewController = EditViewController()
        viewController.user = self.user
        navigationController?.pushViewController(viewController, animated: true)
    }
}
