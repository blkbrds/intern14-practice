//
//  EditViewController.swift
//  Navigation
//
//  Created by PCI0008 on 7/10/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

final class EditViewController: UIViewController {
    
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var newPasswordTextField: UITextField!
    @IBOutlet private weak var confirmPasswordTextField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!
    
    var userData: User = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(calcelButtonDidClick))
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonDidClick))
        
        
        usernameTextField.text = "\(userData.username)"
        navigationItem.leftBarButtonItem = cancelButton
        navigationItem.rightBarButtonItem = doneButton
        
        title = "Edit"
        navigationController?.navigationBar.backgroundColor = .orange
    }
    
    @objc private func doneButtonDidClick() {
        UserDefaults.standard.setValue(self.usernameTextField.text, forKey: "name")
        UserDefaults.standard.synchronize()
        
        saveDatabase()
    }
    
    private func saveDatabase() {
        let users = User.parseData(array: FileManagers.readPlistFile(filename: "user"))
        for user in users {
            if user.username == userData.username {
                if confirmPasswordTextField.text == newPasswordTextField.text {
                    user.password = newPasswordTextField.text!
                    errorLabel.isHidden = true
                    navigationController?.popViewController(animated: true)
                } else {
                    errorLabel.text = "Mat khau khong trung khop"
                    errorLabel.isHidden = false
                }
            }
        }
        var arrs: [[String: String]] = []
        
        for user in users {
            arrs.append(["username": user.username, "password": user.password])
        }
        
        FileManagers.writePlistFile(filename: "user.plist", data: arrs as NSArray)
    }
    
    @objc private func calcelButtonDidClick() {
        navigationController?.popViewController(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension EditViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            newPasswordTextField.becomeFirstResponder()
        } else if textField == newPasswordTextField {
            confirmPasswordTextField.becomeFirstResponder()
        } else if textField == confirmPasswordTextField {
            doneButtonDidClick()
        }
        return true
    }
}
