//
//  HomeViewController.swift
//  Navigation
//
//  Created by MBA0217 on 9/19/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var username: String = ""
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        // Do any additional setup after loading the view.
    }
    
    func configUI () {
        title = "Home"
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editInformation))
        navigationItem.rightBarButtonItem = editButton
        
        let logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logout))
        navigationItem.leftBarButtonItem = logoutButton
        usernameLabel.text = username
    }
    
    @objc func editInformation () {
        let controller = EditViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func logout() {
        for controller in navigationController!.viewControllers {
            if controller.isKind(of: LoginViewController.self) {
                navigationController?.popToViewController(controller, animated: true)
            }
        }
    }
}
