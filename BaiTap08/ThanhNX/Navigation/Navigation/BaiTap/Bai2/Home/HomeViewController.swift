//
//  HomeViewController.swift
//  Navigation
//
//  Created by PCI0008 on 7/10/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    @IBOutlet private weak var userLabel: UILabel!
    
    var user: User = User()
    private var isFirstRun = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutButtonDidClick))
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editButtonDidClick))
        
        navigationItem.leftBarButtonItem = logoutButton
        navigationItem.rightBarButtonItem = editButton
        title = "Home"
        navigationController?.navigationBar.backgroundColor = .magenta
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if isFirstRun {
            userLabel.text = "Welcome \(user.username)"
            isFirstRun = false
        } else {
            userLabel.text = UserDefaults.standard.string(forKey: "name")
            guard let userN = UserDefaults.standard.string(forKey: "name") else { return }
            user.username = userN            
        }
    }
    
    @objc private func logoutButtonDidClick() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func editButtonDidClick() {
        let editVC = EditViewController()
        editVC.user1 = user
        navigationController?.pushViewController(editVC, animated: true)
    }
}
