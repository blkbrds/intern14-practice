//
//  LoginViewController.swift
//  PersonsManagement
//
//  Created by MBA0051 on 10/1/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var messageTextField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func validateLogin(_ sender: UIBarButtonItem) {

        guard let userName = usernameTextField.text, !userName.isEmpty else {
            messageTextField.text = "Username can not empty"
            return
        }
        
        guard let pass = passwordTextField.text, !pass.isEmpty else {
            passwordTextField.text = "password can not empty"
            return
        }

        let (message, userId) = BusinessController.share.checkLogin(username: userName, password: pass)

        if message == nil {
            
            // Storage current user for next proccess.
            UserDefaults.standard.set(userId!, forKey: CommonConstant.USERID)
            UserDefaults.standard.synchronize()
            
            // Push home to Navigation Stack.
            let homePage = HomeViewController()
            navigationController?.pushViewController(homePage, animated: true)
        }
    }
}
