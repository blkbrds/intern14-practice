//
//  ForgotPasswordViewController.swift
//  TabBarController
//
//  Created by MBA0217 on 10/11/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var confirmPasswordLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Forgot Password"
        // Do any additional setup after loading the view.
    }

    private func forgotPassword() {
        if passwordLabel.text?.trimmingCharacters(in: .whitespacesAndNewlines) != "" && passwordLabel.text == confirmPasswordLabel.text {
            SceneDelegate.shared.show(screen: .login)
        }
    }
    
    @IBAction func forgotPasswordTouchUpInside(_ sender: UIButton) {
        forgotPassword()
    }
}
