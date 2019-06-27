//
//  BaiTap04ViewController.swift
//  BaiTapIBOutLetIBAction
//
//  Created by Nguyen Truong Lam Vien on 6/26/19.
//  Copyright © 2019 Nguyen Truong Lam Vien. All rights reserved.
//

import UIKit
class Users {
    private var username = String()
    private var password = String()
    
    init(_ user: String, _ pass: String) {
        username = user
        password = pass
    }
    
    func getUsername() -> String {
        return username
    }
    
    func getPassword() -> String {
        return password
    }
}

class BaiTap04ViewController: UIViewController {
    var item = Users("admin", "admin123")
   
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var alertErrorLabel: UILabel!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var clearFieldButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertErrorLabel.isHidden = true
        design()
        hideKeyboard()
    }
    
    //MARK: design TextField
    private func design(){
        usernameTextField.layer.cornerRadius = 8
        usernameTextField.layer.borderWidth  = 0.2
        usernameTextField.layer.borderColor = UIColor(red: 27 / 255.0, green: 156 / 255.0, blue: 252 / 255.0, alpha: 1).cgColor
    
        passwordTextField.layer.cornerRadius = 8
        passwordTextField.layer.borderWidth = 0.2
        passwordTextField.layer.borderColor = UIColor(red: 27 / 255.0, green: 156 / 255.0, blue: 252 / 255.0, alpha: 1).cgColor
        passwordTextField.isSecureTextEntry = true
        
        loginButton.layer.cornerRadius = 8
        
        clearFieldButton.layer.cornerRadius = 8
    }
    
    func checkLogin() {
        if usernameTextField.text == item.getUsername() && passwordTextField.text == item.getPassword() {
            alertErrorLabel.isHidden = true
        } else if let user = usernameTextField.text, let password = passwordTextField.text, user.isEmpty || password.isEmpty {
            if user.isEmpty {
                alertErrorLabel.text = "Username has not been entered"
                alertErrorLabel.isHidden = false
            } else {
                alertErrorLabel.text = "Password has not been entered"
                alertErrorLabel.isHidden = false
            }
        } else if let user = usernameTextField.text, user != item.getUsername() {
            alertErrorLabel.text = "Username is not correct"
            alertErrorLabel.isHidden = false
        }else if let password = passwordTextField.text, password != item.getPassword() {
            alertErrorLabel.text = "Password is not correct"
            alertErrorLabel.isHidden = false
        }else {
            alertErrorLabel.isHidden = false
        }
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func loginTouchUpInside(_ sender: Any) {
        checkLogin()
    }
    
    @IBAction func clearFieldButton(_ sender: Any) {
        usernameTextField.text = nil
        passwordTextField.text = nil
    }
}

extension BaiTap04ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if textField == self.usernameTextField {
            self.passwordTextField.becomeFirstResponder()
        } else if textField == self.passwordTextField {
            checkLogin()
        }
        return true
    }
}

