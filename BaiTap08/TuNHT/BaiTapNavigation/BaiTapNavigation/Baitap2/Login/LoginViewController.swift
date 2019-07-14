//
//  LoginViewController.swift
//  BaiTapNavigation
//
//  Created by PCI0001 on 7/10/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    var users: [UserData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        errorLabel.isHidden = true
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        users = UserData.parseData(array: FileManager.readPlistFile(filename: "User"))
        
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        navigationItem.rightBarButtonItem = doneBarButton
    }
    
    @objc func done() {
        for user in users {
            if user.username != usernameTextField.text || user.password != passwordTextField.text {
                errorLabel.isHidden = false
            } else {
                errorLabel.isHidden = true
                let viewController = Bai2HomeViewController()
                navigationController?.pushViewController(viewController, animated: true)
            }
            passwordTextField.text?.removeAll()
            usernameTextField.text?.removeAll()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            for user in users {
                if usernameTextField.text != user.username || passwordTextField.text != user.password {
                    errorLabel.isHidden = false
                } else {
                    errorLabel.isHidden = true
                    let viewController = Bai2HomeViewController()
                    navigationController?.pushViewController(viewController, animated: true)
                }
            }
        }
        return true
    }
}
