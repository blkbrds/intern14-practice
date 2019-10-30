//
//  LoginViewController.swift
//  Login
//
//  Created by MBA0051 on 9/27/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tapGesture = UITapGestureRecognizer()
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(myviewTapped))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tapGesture)
        
        customizeKeyboard()
        // Do any additional setup after loading the view.
    }
    
    /**
     * Setting keyboard.
     */
    private func customizeKeyboard() {
        usernameTextField.delegate = self
        usernameTextField.tag = 0
        usernameTextField.returnKeyType = UIReturnKeyType.next
        passwordTextField.delegate = self
        passwordTextField.tag = 1
        passwordTextField.returnKeyType = UIReturnKeyType.go
    }
    
    /**
     * Key press event.
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            checkLogin(self)
            return true;
        }
        return false
    }
    
    /**
     * Hidden keyboard.
     */
    @objc func myviewTapped() {
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    /**
     * Check login function.
     */
    @IBAction func checkLogin(_ sender: Any) {
        myviewTapped()
        
        guard let username = usernameTextField.text else {
            errorLabel.text = "user name invalid."
            return
        }
        
        guard let password = passwordTextField.text else {
            errorLabel.text = "password invalid."
            return
        }
        
        if (username.elementsEqual("Admin") && password.elementsEqual("Admin123")) {
            errorLabel.text = ""
        } else {
            errorLabel.text = "Username and password invalid."
        }
    }
    
    /**
     * Clear data button has clicked.
     */
    @IBAction func clearData(_ sender: Any) {
        myviewTapped()
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
}
