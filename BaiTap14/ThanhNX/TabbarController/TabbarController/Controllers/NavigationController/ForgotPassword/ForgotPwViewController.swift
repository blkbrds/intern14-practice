//
//  ForgotPwViewController.swift
//  TabbarController
//
//  Created by PCI0008 on 8/22/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

class ForgotPwViewController: BaseViewController {
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var newPassTextField: UITextField!
    @IBOutlet private weak var confirmPassTextField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!
    
    private var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonDidClick))
        
        navigationItem.rightBarButtonItem = doneButton
        title = "Forgot Password"
        errorLabel.isHidden = true
    }
    
    private func saveDatabase() {
        users = User.parseData(array: FileManagers.readPlistFile(filename: "user"))
        for user in users {
            if confirmPassTextField.text == newPassTextField.text {
                user.password = newPassTextField.text!
                errorLabel.isHidden = true
                navigationController?.popViewController(animated: true)
            } else {
                errorLabel.text = "Mat khau khong trung khop"
                errorLabel.isHidden = false
            }
        }
        
        var arrs: [[String: String]] = []
        
        for user in users {
            arrs.append(["username": user.username, "password": user.password])
        }
        
        FileManagers.writePlistFile(filename: "user.plist", data: arrs as NSArray)
    }
    
    @objc private func doneButtonDidClick() {
        UserDefaults.standard.setValue(self.nameTextField.text, forKey: "name")
        UserDefaults.standard.synchronize()
        saveDatabase()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension ForgotPwViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            newPassTextField.becomeFirstResponder()
        } else if textField == newPassTextField {
            confirmPassTextField.becomeFirstResponder()
        } else if textField == confirmPassTextField {
            doneButtonDidClick()
        }
        return true
    }
}
