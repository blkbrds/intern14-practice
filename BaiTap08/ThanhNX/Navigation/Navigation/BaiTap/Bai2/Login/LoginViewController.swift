//  LoginViewController.swift
//  Navigation
//
//  Created by PCI0008 on 7/10/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
    var users: [User] = []
    
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!
    
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
        guard let username = usernameTextField.text, let pw = passwordTextField.text else { return }
        users = User.parseData(array: FileManagers.readPlistFile(filename: "user"))
        if let user = users.first(where: { $0.username.elementsEqual(username) && $0.password.elementsEqual(pw) }) {
            let homeVC = HomeViewController()
            homeVC.user = user
            navigationController?.pushViewController(homeVC, animated: true)
            usernameTextField.text?.removeAll()
            passwordTextField.text?.removeAll()
            usernameTextField.becomeFirstResponder()
            errorLabel.isHidden = true
        } else {
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
