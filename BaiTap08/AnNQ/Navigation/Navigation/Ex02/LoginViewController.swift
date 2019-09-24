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
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
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
    
    func doLogin() {
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

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            login()
        }
        
        return true
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
