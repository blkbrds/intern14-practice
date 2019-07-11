//
//  HomeViewController.swift
//  Navigation
//
//  Created by Nguyen Duong on 7/9/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: Properties
    
    @IBOutlet weak var userNameLabel: UILabel!
    var username = ""
    private var isFirstDisplay: Bool = true
    
    // MARK: Life cycle function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUIHome()
        getUser()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if isFirstDisplay {
            isFirstDisplay = !isFirstDisplay
        } else {
            userNameLabel.text = UserDefaults.standard.string(forKey: "username")
            username = UserDefaults.standard.string(forKey: "username")!
        }
    }
    
    // MARK: Private/public custom function
    
    private func getUser() {
        userNameLabel.text = username
        userNameLabel.adjustsFontSizeToFitWidth = true

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
    
    // MARK: IBAction function
    
    @objc private func edit() {
        let editViewController = EditViewController()
        editViewController.username = username
        navigationController?.pushViewController(editViewController, animated: true)
    }
    
    @objc private func logout() {
        navigationController?.popToRootViewController(animated: true)
    }
}
