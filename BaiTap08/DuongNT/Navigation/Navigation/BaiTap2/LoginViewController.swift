//
//  LoginViewController.swift
//  Navigation
//
//  Created by Nguyen Duong on 7/9/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    // Marks: Properties
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    private var listUsers = [DataUsers("duongnt1", "duongnt123"),
                            DataUsers("duongnt2", "duongnt1"),
                            DataUsers("admin", "admin"),
                            DataUsers("abc123", "abc123")]
    var nsDictionary: NSDictionary?
    
    // Marks: Life cycle function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTextFields()
        getUser()
        setUpUILogin()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        userNameTextField.text = nil
        passWordTextField.text = nil
        errorLabel.isHidden = true
    }
    
    // Marks: Basic override view function
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // Marks: Private/public custom function
    
    private func configTextFields() {
        userNameTextField.delegate = self
        passWordTextField.delegate = self
    }
    
    private func setUpUILogin() {
        title = "Login"
        let doneButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 44))
        doneButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        doneButton.setTitle("Done", for: .normal)
        doneButton.setTitleColor(.blue, for: .normal)
        
        let rightCustomerView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 44))
        rightCustomerView.addSubview(doneButton)
        
        let rightBarButtonItem = UIBarButtonItem(customView: rightCustomerView)
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    
    @objc private func login() {
        checkLogin()
    }
    
    private func getUser() {
        if let path = Bundle.main.path(forResource: "login", ofType: "plist") {
            nsDictionary = NSDictionary(contentsOfFile: path)
        }
        let username = nsDictionary?.object(forKey: "username") ?? nil!
        let password = nsDictionary?.object(forKey: "password") ?? nil!
        listUsers.append(DataUsers(username as! String, password as! String))
        print(listUsers)
        
    }
    
    private func checkLogin() {
        if let username = userNameTextField.text, let password = passWordTextField.text {
            if username.isEmpty || password.isEmpty {
                errorLabel.text = "Pls nhập username và password"
                errorLabel.isHidden = false
            } else {
                for user in listUsers {
                    if username == user.username {
                        if password == user.password {
                            errorLabel.isHidden = true
                            let homeViewController = HomeViewController()
                            homeViewController.username = username
                            navigationController?.pushViewController(homeViewController, animated: true)
                            return
                        } else {
                            errorLabel.text = "Nhập sai username & password"
                            errorLabel.isHidden = false
                        }
                    } else {
                        if password != user.password {
                            errorLabel.text = "Nhập sai username & password"
                            errorLabel.isHidden = false
                        } else {
                            errorLabel.text = "Nhập sai username & password"
                            errorLabel.isHidden = false
                        }
                    }
                }
            }
        }
    }    
}

extension LoginViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passWordTextField.becomeFirstResponder()
        } else if textField == passWordTextField {
            checkLogin()
            passWordTextField.resignFirstResponder()
        }
        return true
    }
}
