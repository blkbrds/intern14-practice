//
//  Ex04.swift
//  BaitapIBaction
//
//  Created by PCI0007 on 6/27/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

class Ex04: UIViewController {

    @IBOutlet private weak var idTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var cancelButton: UIButton!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var loginMessege: UILabel!
    
    let id = "admin"
    let passWord = "admin123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTextField()
        setBorderForIdPassword()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if touch.view != idTextField || touch.view != passwordTextField || touch.view == loginButton || touch.view == cancelButton {
                view.endEditing(true)
                loginMessege.text = nil
            }
        }
    }
    
    private func configTextField() {
        idTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    @IBAction private func loginButton(_ sender: Any) {
        if id == idTextField.text && passWord == passwordTextField.text {
            loginMessege.text = "Logged In"
        } else {
            loginMessege.text = "Wrong ID or Password"
        }
        view.endEditing(true)
    }
    
    @IBAction private func cancelButton(_ sender: Any) {
        idTextField.text = nil
        passwordTextField.text = nil
        loginMessege.text = nil
        view.endEditing(true)
    }
    
    func setBorderForIdPassword() {
        idTextField.layer.borderWidth = 1
        idTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
    }
}

extension Ex04: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == idTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            loginButton(Any.self)
        }
        return true
    }
}
