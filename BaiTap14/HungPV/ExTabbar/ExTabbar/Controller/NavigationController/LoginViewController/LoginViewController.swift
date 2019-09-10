//
//  LoginViewController.swift
//  ExTabbar
//
//  Created by PCI0010 on 9/9/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var data = [User]()
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        configUI()
    }
    
    func configUI() {
        title = " Login "
        navigationController?.navigationBar.backgroundColor = .cyan
        mainView.layer.cornerRadius = 10
    }
    
    func fetchData() {
        DataManagement.share.preparePlistForUse()
        let data = DataManagement.share.getListUserInfo(fileName: "Users", type: "plist")
        self.data = data
    }
    
    func checkLogin() {
        guard let userName = userNameText.text, let passWord = passwordText.text else { return }
        for index in 0..<data.count {
            let item = data[index]
            if item.username == userName {
                if item.password == passWord {
                    let defaults = UserDefaults.standard
                    defaults.set(userName, forKey: "id")
                    AppDelegate.shared.pushViewController(controllers: .tabBar)
        
                } else {
                    userNameText.text?.removeAll()
                    passwordText.text?.removeAll()
                }
            }
            
        }
        
    }
    
    @IBAction func loginDidClick(_ sender: UIButton) {
        checkLogin()
    }
    
    @IBAction func forgotDidClick(_ sender: UIButton) {
        navigationController?.pushViewController(ForgotViewController(), animated: true)
    }
    
    @IBAction func registerDidClick(_ sender: UIButton) {
        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
    
}
