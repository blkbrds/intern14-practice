//
//  RegisterViewController.swift
//  TabBarController
//
//  Created by Nguyen Duong on 8/22/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class RegisterViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passWordTextField: UITextField!

    // MARK: Life cycle function
    override func viewDidLoad() {
        super.viewDidLoad()
        configTextFields()
        setUpUILogin()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        userNameTextField.text = nil
        passWordTextField.text = nil
    }

    // MARK: - Private/public custom function
    private func configTextFields() {
        userNameTextField.delegate = self
        passWordTextField.delegate = self
    }
    
    private func setUpUILogin() {
        title = "Login"
        let doneButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(login))
        navigationItem.rightBarButtonItem = doneButtonItem
    }
    
    @objc private func login() {
        register()
    }
    
    private func register() {
        if let username = userNameTextField.text, let password = passWordTextField.text {
            if username.isEmpty || password.isEmpty {
                alertSettings(title: "Warning", message: "Nhập username & password")
            } else {
                users.forEach {
                    user in
                    if username == user.username {
                        alertSettings(title: "Warning", message: "User is exist in system!")
                        return
                    }
                }
                guard let newUserName = userNameTextField.text, let newPassword = passWordTextField.text else {
                    return
                }
                let user = User(username: newUserName, password: newPassword)
                FileManagers.writePlist(user)
                navigationController?.popViewController(animated: true)
            }
        }
    }

    
    @IBAction func registerButtonTouchUpInside(_ button: UIButton) {
        register()
    }
}

extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passWordTextField.becomeFirstResponder()
        } else if textField == passWordTextField {
            register()
            passWordTextField.resignFirstResponder()
        }
        return true
    }
}
