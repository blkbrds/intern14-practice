//
//  LoginViewController.swift
//  BaiTapNavigation
//
//  Created by PCI0013 on 7/10/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    let vc = HomeViewController()
    var users : [User] = []

    @IBOutlet weak var alertLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(checkUser))
        navigationItem.rightBarButtonItem = doneButton
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        alertLabel.isHidden = true
        loadFilePlist()
    }
    
    @objc func checkUser() {
        if let username = usernameTextField.text, let password = passwordTextField.text {
            if username.isEmpty || password.isEmpty {
                alertLabel.text = "Please enter username and password"
                alertLabel.isHidden = false
            } else {
                for user in users {
                    if username != user.username || password != user.password {
                            alertLabel.text = "Wrong username and password"
                            alertLabel.isHidden = false
                        } else {
                            alertLabel.isHidden = true
                            UserDefaults.standard.setValue(self.usernameTextField.text, forKey: "username")
                            vc.username = usernameTextField.text!
                            navigationController?.pushViewController(vc, animated: true)
                            AppDelegate.shared.moveToHome()
                            return
                        }
                    }
                }
            }
        }
    
    func loadFilePlist() {
        let a = UserDefaults.standard.bool(forKey: "firstLoad")
        print(a)
        if !a {
            Manager.copyFilesFromBundleToDocumentsFolderWith(fileExtension: "plist")
            UserDefaults.standard.set(true, forKey: "firstLoad")
        }
        users = User.parseData(array: Manager.readPlist(namePlist: "UP"))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            checkUser()
        }
        return true
    }
}



