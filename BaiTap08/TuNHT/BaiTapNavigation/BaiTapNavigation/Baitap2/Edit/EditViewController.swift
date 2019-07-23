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
    @IBOutlet weak var errorLabel: UILabel!
    var users: [Bai2UserData] = []
    var user: Bai2UserData = Bai2UserData()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit"
        errorLabel.isHidden = true
        usernameTextField.text = user.username
        
        let cancelBarButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        navigationItem.leftBarButtonItem = cancelBarButton
        
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        navigationItem.rightBarButtonItem = doneBarButton
        setupData()
    }
    
    private func setupData() {
        let db = Bai2Manager()
        users = Bai2UserData.parseData(array: db.getData())
    }
    
    @objc func cancel() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func done() {
        guard let name = usernameTextField.text, let pw = newPasswordTextField.text, confirmPasswordTextField.text == pw else {
            errorLabel.isHidden = false
            return
        }
        for user in users where user.username == name {
            user.username = name
            user.password = pw
            UserDefaults.standard.setValue(self.usernameTextField.text, forKey: "username")
            UserDefaults.standard.setValue(self.newPasswordTextField.text, forKey: "password")
            UserDefaults.standard.synchronize()
            Bai2Manager().saveDataToDocument(users)
        }
        navigationController?.popViewController(animated: true)
    }
}
