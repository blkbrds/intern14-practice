//
//  LoginViewController.swift
//  TabBarController
//
//  Created by MBA0217 on 10/11/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Login"
    }
    
    private func login() {
        if usernameLabel.text?.trimmingCharacters(in: .whitespacesAndNewlines) != "" && passwordLabel.text?.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
            SceneDelegate.shared.show(screen: .tabBar)
        }
    }


    @IBAction func loginTouchUpInside(_ sender: UIButton) {
        login()
    }
    
    @IBAction func registerTouchUpInside(_ sender: UIButton) {
        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }

    @IBAction func forgotTouchUpInside(_ sender: UIButton) {
        navigationController?.pushViewController(ForgotPasswordViewController(), animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
