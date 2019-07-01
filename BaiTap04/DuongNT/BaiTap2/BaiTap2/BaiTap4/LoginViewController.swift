//
//  LoginViewController.swift
//  BaiTap2
//
//  Created by Nguyen Duong on 7/1/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var lblError: UILabel!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnClear: UIButton!
    
    @IBAction func btnLogin(_ sender: UIButton) {
        login()
    }   
    
    @IBAction func btnClear(_ sender: UIButton) {
        userNameTextField.text?.removeAll()
        passwordTextField.text?.removeAll()
        lblError.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setButton()
        configTextFields()
    }

    func setButton() {
        btnLogin.backgroundColor = .blue
        btnLogin.layer.cornerRadius = 10
        btnLogin.frame = CGRect(x: UIScreen.main.bounds.width / 2 - 104, y: UIScreen.main.bounds.height / 2 - 160, width: 70, height: 30)
        btnClear.backgroundColor = .blue
        btnClear.layer.cornerRadius = 10
        btnClear.frame = CGRect(x: UIScreen.main.bounds.width / 2 + 34, y: UIScreen.main.bounds.height / 2 - 160, width: 70, height: 30)
        lblError.textColor = .red
    }
    
    private func configTextFields() {
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func login() {
        if let username = userNameTextField.text, let password = passwordTextField.text {
            if username.isEmpty || password.isEmpty {
                lblError.text = "Pls nhập username và password"
                lblError.isHidden = false
            } else {
                if username == UserData.username {
                    if password == UserData.password {
                        lblError.isHidden = true
                    } else {
                        lblError.text = "Nhập sai password"
                        lblError.isHidden = false
                    }
                } else {
                    if password != UserData.password {
                        lblError.text = "Nhập sai username & password"
                        lblError.isHidden = false
                    } else {
                        lblError.text = "Nhập sai username"
                        lblError.isHidden = false
                    }
                }
            }
        }
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
