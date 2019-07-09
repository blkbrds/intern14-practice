//
//  HomeViewController.swift
//  Navigation
//
//  Created by Nguyen Duong on 7/9/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // Marks: Properties
    
    @IBOutlet weak var userNameLabel: UILabel!
    var username = ""
    
    // Marks: Life cycle function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUIHome()
        getUser()
    }
    
    private func getUser() {
        userNameLabel.text = username
    }
    
    private func setUpUIHome() {
        title = "Home"
        let editButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 44))
        editButton.addTarget(self, action: #selector(edit), for: .touchUpInside)
        editButton.setTitle("Edit", for: .normal)
        editButton.setTitleColor(.blue, for: .normal)
        
        let rightCustomerView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 44))
        rightCustomerView.addSubview(editButton)
        
        let logoutButton = UIButton(frame: CGRect(x: 0, y: 0, width: 80, height: 44))
        logoutButton.addTarget(self, action: #selector(logout), for: .touchUpInside)
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.setTitleColor(.blue, for: .normal)
        
        let leftCustomerView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 44))
        leftCustomerView.addSubview(logoutButton)
        
        let rightBarButtonItem = UIBarButtonItem(customView: rightCustomerView)
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
        let leftBarButtonItem = UIBarButtonItem(customView: leftCustomerView)
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    @objc private func edit() {
        let editViewController = EditViewController()
        editViewController.username = username
        navigationController?.pushViewController(editViewController, animated: true)
    }
    
    @objc private func logout() {
        navigationController?.popToRootViewController(animated: true)
    }
}
