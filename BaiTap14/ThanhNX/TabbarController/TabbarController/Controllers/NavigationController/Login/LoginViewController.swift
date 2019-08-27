//  LoginViewController.swift
//  Navigation
//
//  Created by PCI0008 on 7/10/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

final class LoginViewController: BaseViewController {
    private var users: [User] = []
    
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonDidClick))
        self.navigationItem.rightBarButtonItem  = doneButton
        
        let registerButton = UIBarButtonItem(title: "Register", style: .plain, target: self, action: #selector(registerButtonDidClick))
        self.navigationItem.leftBarButtonItem = registerButton
        title = "Login"
        navigationController?.navigationBar.backgroundColor = .orange
    }
    
    //MARK: func Login
    private func login() {
        guard let username = usernameTextField.text, let pw = passwordTextField.text else { return }
        users = User.parseData(array: FileManagers.readPlistFile(filename: "user"))
        if let user = users.first(where: { $0.username.elementsEqual(username) && $0.password.elementsEqual(pw) }) {
            let homeVC = HomeViewController()
            homeVC.user = user
            DispatchQueue.main.async {                
                AppDelegate.shared.changeRoot(controller: .tabbar, vc: self)
                self.usernameTextField.text?.removeAll()
                self.passwordTextField.text?.removeAll()
                self.usernameTextField.becomeFirstResponder()
                self.errorLabel.isHidden = true
            }
            
        } else {
            errorLabel.isHidden = false
        }
    }
    
    @objc private func registerButtonDidClick() {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func doneButtonDidClick() {
        login()
    }
    @IBAction func forgotButtonTouchUpInside() {
        let vc = ForgotPwViewController()
        navigationController?.pushViewController(vc, animated: true)
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
