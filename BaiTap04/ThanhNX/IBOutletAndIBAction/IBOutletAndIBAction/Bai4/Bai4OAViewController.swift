//
//  Bai4OAViewController.swift
//  IBOutletAndIBAction
//
//  Created by PCI0008 on 6/25/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

struct DummyData {
    static let username = "admin"
    static let password = "admin123"
}

class Bai4OAViewController: UIViewController {
    
    //MARK: - Properties
    
    //MARK: - Outlets
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var clearButton: UIButton!
    @IBOutlet private weak var errorLabel: UILabel!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 10
        clearButton.layer.cornerRadius = 10
    }
    
    //MARK: - Actions
    @IBAction private func loginButtonTouchUpInside(_ sender: UIButton) {
        login()
    }
    @IBAction private func clearButtonTouchUpInside(_ sender: UIButton) {
        usernameTextField.text?.removeAll()
        passwordTextField.text?.removeAll()
        errorLabel.isHidden = true
        print("Clear")
    }
    
    //MARK: - Touch events
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func login() {
        if let username = usernameTextField.text, let password = passwordTextField.text {
            if username.isEmpty || password.isEmpty {
                errorLabel.text = "Please fill full"
                errorLabel.isHidden = false
            } else {
                if username == DummyData.username {
                    if password == DummyData.password {
                        errorLabel.isHidden = true
                        print("Login")
                    } else {
                        errorLabel.text = "nhập sai password"
                        errorLabel.isHidden = false
                    }
                } else {
                    if password != DummyData.password {
                        errorLabel.text = "nhập sai username & password"
                        errorLabel.isHidden = false
                    } else {
                        errorLabel.text = "nhập sai username"
                        errorLabel.isHidden = false
                    }
                }
            }
        }
    }
}

extension Bai4OAViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            login()
        } else {
            print("Nothing")
        }
        return true
    }
    
}
