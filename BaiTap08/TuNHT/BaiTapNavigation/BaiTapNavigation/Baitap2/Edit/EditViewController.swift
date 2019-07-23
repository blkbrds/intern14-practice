//
//  EditViewController.swift
//  BaiTapNavigation
//
//  Created by PCI0001 on 7/10/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    var user: UserData = UserData()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit"
        usernameTextField.text = user.username
        
        let cancelBarButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        navigationItem.leftBarButtonItem = cancelBarButton
        
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        navigationItem.rightBarButtonItem = doneBarButton
    }
    
    @objc func cancel() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func done() {
        UserDefaults.standard.setValue(self.usernameTextField.text, forKey: "username")
        UserDefaults.standard.synchronize()
        navigationController?.popViewController(animated: true)
        
    }
}
