//
//  EditViewController.swift
//  Navigation
//
//  Created by MBA0217 on 9/19/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    func configUI () {
        title = "Edit"
        let submitButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(submit))
        navigationItem.rightBarButtonItem = submitButton
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancel))
        navigationItem.leftBarButtonItem = cancelButton
        
        usernameTextField.layer.borderWidth = 1
        usernameTextField.layer.borderColor = UIColor.blue.cgColor
        usernameTextField.setLeftPaddingPoints(10)
        usernameTextField.layer.cornerRadius = 5
        
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor.blue.cgColor
        passwordTextField.setLeftPaddingPoints(10)
        passwordTextField.layer.cornerRadius = 5
        
        confirmPasswordTextField.layer.borderWidth = 1
        confirmPasswordTextField.layer.borderColor = UIColor.blue.cgColor
        confirmPasswordTextField.setLeftPaddingPoints(10)
        confirmPasswordTextField.layer.cornerRadius = 5
        
        errorLabel.isHidden = true
    }
    
    @objc func submit () {
        if usernameTextField.text == "" || passwordTextField.text == "" || confirmPasswordTextField.text == "" {
            errorLabel.text = "Vui lòng nhập đầy đủ thông tin"
            errorLabel.isHidden = false
        } else {
            let homeController = HomeViewController(nibName: "HomeViewController", bundle: nil)
            homeController.username = usernameTextField.text!
            navigationController?.pushViewController(homeController, animated: true)
        }
    }
    
    @objc func cancel () {
        for controller in navigationController!.viewControllers {
            if controller.isKind(of: HomeViewController.self) {
                navigationController?.popToViewController(controller, animated: true)
            }
        }
    }
    
    @IBAction func hiddenError(_ sender: UITextField) {
        errorLabel.isHidden = true
    }
}
