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
        if (usernameTextField.text == "admin" && passwordTextField.text == "abcd1234") {
            // Push home to Navigation Stack.
            let homePage = HomeViewController()
            navigationController?.pushViewController(homePage, animated: true)
        }
    }
    //    @IBAction func validateLogin(_ sender: Any) {
//
//    }
}

extension LoginViewController: UINavigationBarDelegate {
    
    func navigationBar(_ navigationBar: UINavigationBar, didPush item: UINavigationItem) {
        print(123)
    }
}
