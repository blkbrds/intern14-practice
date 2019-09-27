//
//  LoginViewController.swift
//  Login
//
//  Created by MBA0051 on 9/27/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var errorMessageText: UILabel!
    
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
        usernameText.delegate = self
        usernameText.tag = 0
        usernameText.returnKeyType = UIReturnKeyType.next
        passwordText.delegate = self
        passwordText.tag = 1
        passwordText.returnKeyType = UIReturnKeyType.go
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
        usernameText.resignFirstResponder()
        passwordText.resignFirstResponder()
    }
    
    /**
     * Check login function.
     */
    @IBAction func checkLogin(_ sender: Any) {
        myviewTapped()
        
        guard let username = usernameText.text else {
            errorMessageText.text = "user name invalid."
            return
        }
        
        guard let password = passwordText.text else {
            errorMessageText.text = "password invalid."
            return
        }
        
        if (username.elementsEqual("Admin") && password.elementsEqual("Admin123")) {
            errorMessageText.text = nil
        } else {
            errorMessageText.text = "Username and password invalid."
        }
        
    }
    
    /**
     * Clear data button has clicked.
     */
    @IBAction func clearData(_ sender: Any) {
        myviewTapped()
        usernameText.text = nil
        passwordText.text = nil
    }
}
