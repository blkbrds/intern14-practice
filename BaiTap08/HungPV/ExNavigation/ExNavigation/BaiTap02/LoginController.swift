//
//  Ex02ViewController.swift
//  ExNavigation
//
//  Created by PCI0010 on 8/8/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var pwText: UITextField!
    
    var data: [UserInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        navigationController?.navigationBar.backgroundColor = .cyan
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonDidClick))
        navigationItem.rightBarButtonItem = doneButton
        fetchData()
    }
    
    func fetchData() {
        DataManagement.share.preparePlistForUse()
        let data = DataManagement.share.getListUserInfo(fileName: "users", type: "plist")
        self.data = data
    }
    func checkLogin() {
        guard let userName = userText.text, let password = pwText.text else { return }
        for index in 0..<data.count {
            let item = data[index]
            if item.username == userName {
                if item.password == password {
                    errorLabel.isHidden = true
                    let vc = WelcomeViewController()
                    vc.userName = userName
                    userText.text?.removeAll()
                    pwText.text?.removeAll()
                    navigationController?.pushViewController(vc, animated: true)
                    
                } else {
                    errorLabel.isHidden = false
                    errorLabel.text = "Nhập sai Username và Password"
                }
            }
        }
    }
    
    @objc func doneButtonDidClick() {
        checkLogin()
    }
    
}
