//
//  LoginViewController.swift
//  Navigation
//
//  Created by MBA0217 on 9/19/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }

    func configUI() {
        title = "Login"
        let submitButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(login))
        navigationItem.rightBarButtonItem = submitButton
        
        usernameTextField.layer.borderWidth = 1
        usernameTextField.layer.borderColor = UIColor.blue.cgColor
        usernameTextField.setLeftPaddingPoints(10)
        usernameTextField.layer.cornerRadius = 5
        
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor.blue.cgColor
        passwordTextField.setLeftPaddingPoints(10)
        passwordTextField.layer.cornerRadius = 5
        
        errorLabel.isHidden = true
        handleKeyBoard()
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
    
    @objc func login () {
        if usernameTextField.text == "" || passwordTextField.text == "" {
            errorLabel.text = "Vui lòng nhập đầy đủ thông tin"
            errorLabel.isHidden = false
        } else {
            let homeController = HomeViewController(nibName: "HomeViewController", bundle: nil)
            homeController.username = usernameTextField.text!
            navigationController?.pushViewController(homeController, animated: true)
        }
    }
    
    @IBAction func hiddenError(_ sender: UITextField) {
        errorLabel.isHidden = true
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
