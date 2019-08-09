//
//  LoginViewController.swift
//  Navigation
//
//  Created by Nguyen Duong on 7/9/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passWordTextField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!

    // MARK: - Properties
    private var users: [User] = []

    // MARK: Life cycle function
    override func viewDidLoad() {
        super.viewDidLoad()
        configTextFields()
        loadFilePlist()
        setUpUILogin()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        userNameTextField.text = nil
        passWordTextField.text = nil
        errorLabel.isHidden = true
    }

    // MARK: - Basic override view function
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    // MARK: - Private/public custom function
    private func configTextFields() {
        userNameTextField.delegate = self
        passWordTextField.delegate = self
    }

    private func loadFilePlist() {
        let isFistLoad = UserDefaults.standard.bool(forKey: "firstLoad")
        if !isFistLoad {
            FileManagers.copyFilesFromBundleToDocumentsFolderWith(fileExtension: "plist")
            UserDefaults.standard.set(true, forKey: "firstLoad")
            users = User.parseData(array: FileManagers.readPlist(namePlist: "users"))
        } else {
            users = User.parseData(array: FileManagers.readPlist(namePlist: "users"))
        }
    }

    private func setUpUILogin() {
        title = "Login"
        let doneButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 44))
        doneButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        doneButton.setTitle("Done", for: .normal)
        doneButton.setTitleColor(.blue, for: .normal)
        let rightCustomerView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 44))
        rightCustomerView.addSubview(doneButton)
        let rightBarButtonItem = UIBarButtonItem(customView: rightCustomerView)
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }

    @objc private func login() {
        checkLogin()
    }

    private func checkLogin() {
        if let username = userNameTextField.text, let password = passWordTextField.text {
            if username.isEmpty || password.isEmpty {
                errorLabel.text = "Pls nhập username và password"
                errorLabel.isHidden = false
            } else {
                users.forEach {
                    user in
                    if username == user.username {
                        if password == user.password {
                            errorLabel.isHidden = true
                            let homeViewController = HomeViewController()
                            homeViewController.username = username
                            navigationController?.pushViewController(homeViewController, animated: true)
                            return
                        } else {
                            errorLabel.text = "Nhập sai username & password"
                            errorLabel.isHidden = false
                        }
                    } else {
                        if password != user.password {
                            errorLabel.text = "Nhập sai username & password"
                            errorLabel.isHidden = false
                        } else {
                            errorLabel.text = "Nhập sai username & password"
                            errorLabel.isHidden = false
                        }
                    }
                }
            }
        }
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
