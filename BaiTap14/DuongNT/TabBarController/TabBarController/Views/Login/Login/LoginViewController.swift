//
//  LoginViewController.swift
//  TabBarController
//
//  Created by Nguyen Duong on 8/22/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

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
        checkLogin()
    }

    private func checkLogin() {
        if let username = userNameTextField.text, let password = passWordTextField.text {
            if username.isEmpty || password.isEmpty {
                alertSettings(title: "Warning", message: "Nhập username & password")
            } else {
                users.forEach {
                    user in
                    if username == user.username {
                        if password == user.password {
                            UserDefaults.standard.set(true, forKey: "LOGGED_IN")
                            AppDelegate.shared.switchToVC()
                            return
                        } else {
                            alertSettings(title: "Warning", message: "Nhập sai username & password")
                        }
                    }
                }
                alertSettings(title: "Warning", message: "Nhập sai username & password")
            }
        }
    }

    @IBAction func registerButtonTouchUpInside(_ button: UIButton) {
        let register = RegisterViewController()
        navigationController?.pushViewController(register, animated: true)
    }

    @IBAction func forgotPasswordButtonTouchUpInside(_ button: UIButton) {
        let forgot = ForgotPasswordViewController()
        navigationController?.pushViewController(forgot, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passWordTextField.becomeFirstResponder()
        } else if textField == passWordTextField {
            checkLogin()
            passWordTextField.resignFirstResponder()
        }
        return true
    }
}
