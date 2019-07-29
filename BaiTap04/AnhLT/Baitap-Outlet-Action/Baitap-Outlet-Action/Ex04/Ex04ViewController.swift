//
//  Ex04ViewController.swift
//  Baitap-Outlet-Action
//
//  Created by PCI0013 on 6/27/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

class UserLoginInfo {
    var userName: String
    var password: String

    init(userName: String, password: String) {
        self.userName = userName
        self.password = password
    }
}

class Ex04ViewController: UIViewController {
    
    let myAccount = UserLoginInfo(userName: "admin", password: "admin123")
    @IBOutlet private weak var clearButton: UIButton!
    @IBOutlet private weak var wrongLabel: UILabel!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        loginButton.backgroundColor = .blue
        clearButton.backgroundColor = .blue
        loginButton.layer.cornerRadius = 15
        clearButton.layer.cornerRadius = 15
        wrongLabel.textColor = .red
        wrongLabel.isHidden = true
    }
    
    private func configTextField() {
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    @IBAction private func clearButtonTouchUpInside(_ sender: Any) {
        usernameTextField.text = nil
        passwordTextField.text = nil
        wrongLabel.text = nil
    }
    
    @IBAction private func loginButtonTouchUpInside(_ sender: Any) {
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
}

extension Ex04ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            loginButtonTouchUpInside(Any.self)
        }
        return true
    }
}
