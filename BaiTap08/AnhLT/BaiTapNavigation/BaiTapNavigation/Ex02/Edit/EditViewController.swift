//
//  EditViewController.swift
//  BaiTapNavigation
//
//  Created by PCI0013 on 7/10/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

class EditViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmationPasswordTextField: UITextField!
    @IBOutlet weak var alertLabel: UILabel!
    var username: String = ""
    var users : [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancel))
        navigationItem.leftBarButtonItem = cancelButton
        
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(done))
        navigationItem.rightBarButtonItem = doneButton
        usernameTextField.text = username
        alertLabel.isHidden = true
        newPasswordTextField.delegate = self
        confirmationPasswordTextField.delegate = self
    }
    
    func changePassword() {
        if newPasswordTextField.text != confirmationPasswordTextField.text {
            alertLabel.text = "Password does not match"
            alertLabel.isHidden = false
        }
    }
    
    @objc func cancel() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func done() {
        if let newPassword = newPasswordTextField.text, let confirmPass = confirmationPasswordTextField.text {
            if newPassword.isEmpty == true {
                alertLabel.text = "Please enter new Password"
                alertLabel.isHidden = false
            } else if newPassword == confirmPass{
                
                UserDefaults.standard.setValue(self.usernameTextField.text, forKey: "username")
                UserDefaults.standard.setValue(self.newPasswordTextField.text, forKey: "password")
                guard let newUsername = usernameTextField.text, let newPassword = confirmationPasswordTextField.text else {
                    return
                }
                let user = User(username: newUsername, password: newPassword)
                Manager.writePlist(user, username)
                self.navigationController?.popViewController(animated: true)
                
            } else {
                changePassword()
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == newPasswordTextField {
            confirmationPasswordTextField.becomeFirstResponder()
        } else if textField == confirmationPasswordTextField {
            done()
        }
        return true
    }
}

