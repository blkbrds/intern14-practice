//
//  RegisterViewController.swift
//  TabbarController
//
//  Created by PCI0008 on 8/22/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

class RegisterViewController: BaseViewController {
    //MARK: Outlet
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var confirmPasswordTextField: UITextField!
    
    //MARK: Propeties
    private var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
        title = "Register"
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonDidClick))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    override func setupData() {
        users = User.parseData(array: FileManagers.readPlistFile(filename: "user"))
    }
    
    @objc private func doneButtonDidClick() {
        register()
    }
    
    @IBAction func registerButtonTouchUpInside() {
        register()
    }
    
    //MARK: func Register
    private func register() {
        guard let username = usernameTextField.text, let pw = passwordTextField.text, let confirmPw = confirmPasswordTextField.text else { return }
        if username.isEmpty || pw.isEmpty, confirmPw.isEmpty {
            alert(title: "Warning", message: "Username or Password is missing")
        } else {
            users.forEach { user in
                if username == user.username {
                    alert(title: "Warning", message: "User name already exists")
                    return
                }
            }
            guard let newUserName = usernameTextField.text, let newPw = passwordTextField.text, let newConfirmPw = confirmPasswordTextField.text else { return }
            if newConfirmPw == newPw {
                let newUser = User(username: newUserName, password: newPw)
                FileManagers.writePlist(filename: "user", user: newUser)
                navigationController?.popViewController(animated: true)
            } else {
                alert(title: "Warning", message: "password does not match")
            }
        }
    }
}

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            confirmPasswordTextField.becomeFirstResponder()
        } else if textField == confirmPasswordTextField {
            register()
        }
        return true
    }
}
