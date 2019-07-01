//
//  Ex04ViewController.swift
//  Baitap-Outlet-Action
//
//  Created by PCI0013 on 6/27/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit
class LoginScreen {
    var userName = String()
    var password = String()

    init(_ userName: String,_ password: String) {
    self.userName = userName
    self.password = password
    }
}

class Ex04ViewController: UIViewController {
    let myAccount = LoginScreen("admin", "admin123")
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var wrongLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        wrongLabel.isHidden = true
        design()
    }
    
    func configTextField() {
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    @IBAction func clearButtonTouchUpInside(_ sender: Any) {
        usernameTextField.text = nil
        passwordTextField.text = nil
        wrongLabel.text = nil
    }
    
    @IBAction func loginButtonTouchUpInside(_ sender: Any) {
        if usernameTextField.text == myAccount.userName && passwordTextField.text == myAccount.password {
            wrongLabel.isHidden = true
        } else if let user = usernameTextField.text, let password = passwordTextField.text, user.isEmpty || password.isEmpty
        {
            if user.isEmpty == true {
                wrongLabel.text = "Insert username"
                wrongLabel.isHidden = false
            } else {
                wrongLabel.text = "Insert password"
                wrongLabel.isEnabled = false
            }
        } else if usernameTextField.text != myAccount.userName {
            wrongLabel.text = "Wrong Username"
            wrongLabel.isHidden = false
        } else {
            wrongLabel.text = "Wrong Password"
            wrongLabel.isHidden = false
        }
    }
    
    func design() {
        loginButton.backgroundColor = .blue
        clearButton.backgroundColor = .blue
        loginButton.layer.cornerRadius = 15
        clearButton.layer.cornerRadius = 15
        wrongLabel.textColor = .red
    }
}

extension Ex04ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      
        if textField == usernameTextField {

            passwordTextField.becomeFirstResponder()
   
        } else if textField == passwordTextField {
    
            loginButtonTouchUpInside(Any.self)
        }
        return true
    }
}



    

