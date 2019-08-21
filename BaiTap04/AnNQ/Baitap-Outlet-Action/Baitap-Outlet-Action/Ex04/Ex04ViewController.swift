//
//  Ex04ViewController.swift
//  Baitap-Outlet-Action
//
//  Created by MBA0217 on 8/20/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

class Ex04ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    enum ValidationLogin {
        case usernameOrPasswordIsEmpty(String)
        case usernameOrPasswordIsWrong(String)
        case loginSuccess
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTemplate()
        handleKeyBoard()
    }
    
    func updateTemplate() {
        usernameTextField.layer.cornerRadius = 10
        usernameTextField.layer.borderWidth = 1
        usernameTextField.layer.borderColor = UIColor.black.cgColor
        usernameTextField.setLeftPaddingPoints(10)
        
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor.black.cgColor
        passwordTextField.setLeftPaddingPoints(10)

        loginButton.layer.cornerRadius = 10
        clearButton.layer.cornerRadius = 10
        
        errorLabel.isHidden = true
    }
    
    func validationLogin(username: String, password: String) -> ValidationLogin {
        if username.isEmpty {
            return .usernameOrPasswordIsEmpty("username không được bỏ trống")
        }
        if password.isEmpty {
            return .usernameOrPasswordIsEmpty("password không được bỏ trống")
        }
        
        if username != "Admin" || password != "Admin123" {
            return .usernameOrPasswordIsWrong("Nhập sai username hoặc password")
        }
        return .loginSuccess
    }
    
    func login() {
        switch validationLogin(username: usernameTextField.text!, password: passwordTextField.text!) {
        case .usernameOrPasswordIsWrong(let errMessage):
            errorLabel.text = errMessage
            errorLabel.isHidden = false
        case .usernameOrPasswordIsEmpty(let errMessage):
            errorLabel.text = errMessage
            errorLabel.isHidden = false
        default:
            print("Login success")
            errorLabel.isHidden = true
        }
    }
    
    func handleKeyBoard () {
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        
        usernameTextField.tag = 0
        usernameTextField.returnKeyType = .next
        passwordTextField.tag = 1
        passwordTextField.returnKeyType = .go
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) {
        let nextTag = textField.tag + 1
        
        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder() //Call this method when you want the current object to be the first responder
        } else {
            textField.resignFirstResponder() // turn off keyborad
        }
    }
    
    @IBAction func loginButtonTouchUpInside(_ sender: Any) {
        login()
    }
    
    @IBAction func clearButtonTouchUpInside(_ sender: Any) {
        usernameTextField.text = ""
        passwordTextField.text = ""
        errorLabel.isHidden = true
    }
    
    @IBAction func nextButtonPrimaryActionTriggered(_ sender: Any) {
        textFieldShouldReturn(usernameTextField)
    }
    
    @IBAction func doneButtonPrimaryActionTriggered(_ sender: Any) {
        login()
    }
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
