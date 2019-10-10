//
//  EditInformationViewController.swift
//  PersonsManagement
//
//  Created by MBA0051 on 10/1/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class EditInformationViewController: UIViewController {

    @IBOutlet weak var currentUserTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var messageTextField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadCurrentUserInformation()
    }

    fileprivate func loadCurrentUserInformation() {
        currentUserTextField.text = BusinessController.share.getCurrentUser()!.username
    }

    @IBAction func doCancelButtonClick(_ sender: Any) {
        goBackToHomePage()
    }
    @IBAction func doDoneButtonClick(_ sender: Any) {
        
        if (!validatePassword()) { return }
        
        guard let currentUser = BusinessController.share.getCurrentUser() else {
            messageTextField.text = "Can't get current user."
            return
        }
        let updateUser = UserInfo(userId: currentUser.userId, username: currentUserTextField.text!, password: newPasswordTextField.text!)
        
        if !BusinessController.share.updateUser(updateUser: updateUser) {
            messageTextField.text = "Can't update current user."
            return
        }
        
        // Back to home page.
        goBackToHomePage()
    }
    
    /**
     * Validate new password.
     */
    fileprivate func validatePassword() -> Bool {
        guard !newPasswordTextField.text!.isEmpty && !confirmPasswordTextField.text!.isEmpty else {
            messageTextField.text = "Password couldn't empty."
            return false
        }
        guard newPasswordTextField.text!.count <= 32 && newPasswordTextField.text!.count >= 6 else {
            messageTextField.text = "Password invalid length."
            return false
        }
        guard confirmPasswordTextField.text!.count <= 32 && confirmPasswordTextField.text!.count >= 6 else {
            messageTextField.text = "Confirm password invalid length."
            return false
        }
        return true
    }

    fileprivate func goBackToHomePage() {
        navigationController?.popViewController(animated: true)
    }
}
