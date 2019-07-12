//  LoginViewController.swift
//  Navigation
//
//  Created by PCI0008 on 7/10/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var users: [User] = []
    
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!
    
    var isError = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonDidClick))
        self.navigationItem.rightBarButtonItem  = doneButton
        title = "Login"
        navigationController?.navigationBar.backgroundColor = .orange
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    //MARK: func Login
    private func login() {
        users = User.parseData(array: FileManagers.readPlistFile(filename: "user"))
        for user in users {
            if user.username == usernameTextField.text && user.password == passwordTextField.text {
                let homeVC = HomeViewController()
                homeVC.user = user
                navigationController?.pushViewController(homeVC, animated: true)
                usernameTextField.text?.removeAll()
                passwordTextField.text?.removeAll()
                usernameTextField.becomeFirstResponder()
                isError = false
                if !isError {
                    errorLabel.isHidden = true
                }
            }
        }
        if isError {
            errorLabel.isHidden = false
        }
    }
    
    @objc private func doneButtonDidClick() {
        login()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            login()
        }
        return true
    }
}
