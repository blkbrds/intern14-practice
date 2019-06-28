//
//  BaiTap4.swift
//  BaiTapOutlet&Action
//
//  Created by PCI0001 on 6/26/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

struct Data {
    static let username = "admin"
    static let password = "admin123"
}

class BaiTap4: UIViewController, UITextFieldDelegate {
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    @IBAction private func loginButtonTouchUpInside(_ sender: UIButton) {
        if usernameTextField.text != Data.username || passwordTextField.text != Data.password {
            errorLabel.isHidden = false
            errorLabel.text = "Nhập sai username và password"
        } else {
            errorLabel.isHidden = true
        }
    }
    
    @IBAction private func clearButtonTouchUpInside(_ sender: UIButton) {
        usernameTextField.text?.removeAll()
        passwordTextField.text?.removeAll()
        errorLabel.isHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            if usernameTextField.text != Data.username || passwordTextField.text != Data.password {
                errorLabel.isHidden = false
                errorLabel.text = "Nhập sai username và password"
            } else {
                errorLabel.isHidden = true
            }
        }
        return true
    }
}
