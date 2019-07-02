//
//  LoginViewController.swift
//  BaiTap2
//
//  Created by Nguyen Duong on 7/1/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var clearButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButton()
        configTextFields()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func setButton() {
        loginButton.backgroundColor = .blue
        loginButton.layer.cornerRadius = 10
        loginButton.frame = CGRect(x: UIScreen.main.bounds.width / 2 - 104, y: UIScreen.main.bounds.height / 2 - 160, width: 70, height: 30)
        clearButton.backgroundColor = .blue
        clearButton.layer.cornerRadius = 10
        clearButton.frame = CGRect(x: UIScreen.main.bounds.width / 2 + 34, y: UIScreen.main.bounds.height / 2 - 160, width: 70, height: 30)
        errorLabel.textColor = .red
    }
    
    private func configTextFields() {
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }
   
    private func login() {
        if let username = userNameTextField.text, let password = passwordTextField.text {
            if username.isEmpty || password.isEmpty {
                errorLabel.text = "Pls nhập username và password"
                errorLabel.isHidden = false
            } else {
                if username == UserData.username {
                    if password == UserData.password {
                        errorLabel.isHidden = true
                    } else {
                        errorLabel.text = "Nhập sai password"
                        errorLabel.isHidden = false
                    }
                } else {
                    if password != UserData.password {
                        errorLabel.text = "Nhập sai username & password"
                        errorLabel.isHidden = false
                    } else {
                        errorLabel.text = "Nhập sai username"
                        errorLabel.isHidden = false
                    }
                }
            }
        }
    }
    
    @IBAction private func loginButtonTouchUpInside(_ sender: UIButton) {
        login()
    }
    
    @IBAction private func clearButtonTouchUpInside(_ sender: UIButton) {
        userNameTextField.text?.removeAll()
        passwordTextField.text?.removeAll()
        errorLabel.isHidden = true
    }
    
}

extension LoginViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            login()
        }
        return true
    }
}
