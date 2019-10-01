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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func validateLogin(_ sender: UIBarButtonItem) {

        let userName = usernameTextField.text!
        let pass = passwordTextField.text!
        let (message, userId) = BusinessController.checkLogin(username: userName, password: pass)

        if message == nil {
            
            // Storage current user for next proccess.
            UserDefaults.standard.set(userId!, forKey: CommonConstant.USERID)
            
            // Push home to Navigation Stack.
            let homePage = HomeViewController()
            navigationController?.pushViewController(homePage, animated: true)
        }
    }
}
