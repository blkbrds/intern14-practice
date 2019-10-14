//
//  RegisterViewController.swift
//  TabBarController
//
//  Created by MBA0217 on 10/11/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var confirmPasswordLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Register"
    }
    
    func register() {
        if usernameLabel.text?.trimmingCharacters(in: .whitespacesAndNewlines) != "" && passwordLabel.text?.trimmingCharacters(in: .whitespacesAndNewlines) != ""  && passwordLabel.text == confirmPasswordLabel.text {
            SceneDelegate.shared.show(screen: .tabBar)
        }
    }

    @IBAction func registerTouchUpInside(_ sender: UIButton) {
        register()
    }
}
