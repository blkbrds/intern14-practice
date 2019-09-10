//
//  ForgotPasswordViewController.swift
//  TabBarController
//
//  Created by Nguyen Duong on 8/22/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var confirmPasswordTextField: UITextField!
    @IBOutlet private weak var newPasswordTextField: UITextField!

    // MARK: - Life cycle function
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        setUpUIHome()
        configTextFields()
    }

    // MARK: - Private/public custom function
    private func configTextFields() {
        userNameTextField.delegate = self
        newPasswordTextField.delegate = self
        confirmPasswordTextField.delegate = self
    }

    private func setUpUIHome() {
        title = "Forgot Password"
        let doneButtonBar = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        navigationItem.rightBarButtonItem = doneButtonBar
        let cancelButtonBar = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        navigationItem.leftBarButtonItem = cancelButtonBar
    }
    
    @objc private func done() {
        checkPassword()
    }
    
    @objc private func cancel() {
        navigationController?.popViewController(animated: true)
    }
    
    private func checkPassword() {
        if let newPassword = newPasswordTextField.text, let confirmPassword = confirmPasswordTextField.text, let username = userNameTextField.text {
            if newPassword.isEmpty || confirmPassword.isEmpty {
                alertSettings(title: "Warning", message: "Nhập username & password")
            } else {
                users.forEach {
                    user in
                    if username == user.username {
                        if newPassword == confirmPassword {
                            guard let newUserName = userNameTextField.text, let newPassword = confirmPasswordTextField.text else {
                                return
                            }
                            let user = User(username: newUserName, password: newPassword)
                            FileManagers.writePlist(user, username)
                            navigationController?.popViewController(animated: true)
                        } else {
                            alertSettings(title: "Warning", message: "Password & Confirm password is wrong!!!")
                        }
                    }
                }
                alertSettings(title: "Warning", message: "Nhập sai username & password")
            }
        }
    }

    @IBAction func changeButtonTouchUpInside(_ button: UIButton) {
        checkPassword()
    }
}

extension ForgotPasswordViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            newPasswordTextField.becomeFirstResponder()
        } else if textField == newPasswordTextField {
            confirmPasswordTextField.becomeFirstResponder()
        } else if textField == confirmPasswordTextField {
            checkPassword()
        }
        return true
    }
}
