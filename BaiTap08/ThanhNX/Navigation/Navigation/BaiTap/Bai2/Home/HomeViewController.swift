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
        userLabel.text = "Welcome \(UserDefaults.standard.string(forKey: "name") ?? "")"
    }
    
    @objc private func logoutButtonDidClick() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func editButtonDidClick() {
        let editVC = EditViewController()
        editVC.userData = user
        navigationController?.pushViewController(editVC, animated: true)
    }
}
