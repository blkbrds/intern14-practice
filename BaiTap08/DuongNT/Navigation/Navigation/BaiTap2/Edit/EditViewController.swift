//
//  EditViewController.swift
//  Navigation
//
//  Created by Nguyen Duong on 7/9/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!

    // MARK: - Properties
    var username = ""

    // MARK: - Life cycle function
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUIHome()
        configTextFields()
    }

    // MARK: - Basic override view function
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    // MARK: - Private/public custom function
    private func configTextFields() {
        userNameTextField.delegate = self
        newPasswordTextField.delegate = self
        confirmPasswordTextField.delegate = self
    }

    private func setUpUIHome() {
        title = "Edit"
        userNameTextField.text = username
        let doneButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 44))
        doneButton.addTarget(self, action: #selector(done), for: .touchUpInside)
        doneButton.setTitle("Done", for: .normal)
        doneButton.setTitleColor(.blue, for: .normal)
        let rightCustomerView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 44))
        rightCustomerView.addSubview(doneButton)
        let cancelButton = UIButton(frame: CGRect(x: 0, y: 0, width: 80, height: 44))
        cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.blue, for: .normal)
        let leftCustomerView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 44))
        leftCustomerView.addSubview(cancelButton)
        let rightBarButtonItem = UIBarButtonItem(customView: rightCustomerView)
        navigationItem.rightBarButtonItem = rightBarButtonItem
        let leftBarButtonItem = UIBarButtonItem(customView: leftCustomerView)
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }

    @objc private func done() {
        checkPassword()
    }

    @objc private func cancel() {
        let homeViewController = HomeViewController()
        homeViewController.username = username
        navigationController?.popViewController(animated: true)
    }

    private func checkPassword() {
        if let newPassword = newPasswordTextField.text, let confirmPassword = confirmPasswordTextField.text {
            if newPassword.isEmpty || confirmPassword.isEmpty {
                errorLabel.text = "Pls nhập new pass & confirm"
                errorLabel.isHidden = false
            } else {
                if newPassword == confirmPassword {
                    errorLabel.isHidden = true
                    UserDefaults.standard.set(userNameTextField.text, forKey: "username")
                    UserDefaults.standard.synchronize()
                    print("Changed Pass")
                    guard let newUserName = userNameTextField.text, let newPassword = confirmPasswordTextField.text else {
                        return
                    }
                    let user = User(username: newUserName, password: newPassword)
                    FileManagers.writePlist(user, username)
                    navigationController?.popViewController(animated: true)
                    
                } else {
                    errorLabel.text = "New password # confirm password"
                }
            }
        }
    }
}

extension EditViewController : UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            newPasswordTextField.becomeFirstResponder()
        } else if textField == newPasswordTextField {
            confirmPasswordTextField.becomeFirstResponder()
        } else if textField == confirmPasswordTextField {
            checkPassword()
        }
        return true
    }
}
