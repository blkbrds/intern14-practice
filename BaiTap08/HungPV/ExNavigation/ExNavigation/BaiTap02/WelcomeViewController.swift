//
//  WelcomeViewController.swift
//  ExNavigation
//
//  Created by PCI0010 on 8/8/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

protocol WelcomeViewControllerDelegate: class {
    func reloadData(path: String)
}

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    var userName = ""
    var user: UserInfo?
    weak var delegate: WelcomeViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        navigationController?.navigationBar.backgroundColor = .cyan
        usernameLabel.text = userName
        let logoutButton = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(logoutButtonDidClick))
        navigationItem.leftBarButtonItem = logoutButton
        let editButton = UIBarButtonItem(title: "Edit", style: .done, target: self, action: #selector(editButtonDidClick))
        navigationItem.rightBarButtonItem = editButton
    }
    
    @objc private func logoutButtonDidClick() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func editButtonDidClick() {
        let vc = EditViewController()
        vc.oldUser = user
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension WelcomeViewController: EditViewControllerDelegate {
    func didEditedUser(user: UserInfo) {
        self.user = user
    }
    
    func didSavedData(path: String) {
        if let delegate = delegate {
            delegate.reloadData(path: path)
        }
    }
}
