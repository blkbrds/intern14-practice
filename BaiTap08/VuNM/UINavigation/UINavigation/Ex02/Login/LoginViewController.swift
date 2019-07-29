//
//  EditViewController.swift
//  DemoNavi
//
//  Created by PCI0007 on 7/10/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var user: [UserData] = []
    @IBOutlet weak var messegeLabel: UILabel!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
    var id: String = ""
    var pass: String = ""
    var isFirstRun = true
    
    static let shared = LoginViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonAction))
        navigationItem.rightBarButtonItem = doneButton
        setBorderForIdPassword()
        configTextField()
    }
    
  
    func login() {
        let path = HandlePlist.shared.plistInDocument
        let arr = NSArray(contentsOfFile: path) as? [[String: String]]
        user = UserData.parseDataOfIDAndPass(array: arr!)
        for i in 0..<user.count {
            if user[i].id == idTextField.text && user[i].pass == passTextField.text {
                let h = HomeViewController()
                id = idTextField.text ?? ""
                UserDefaults.standard.set(self.idTextField.text, forKey: "id")
                messegeLabel.text = ""
                navigationController?.pushViewController(h, animated: true)
            } else {
                messegeLabel.text = "Wrong login information"
            }
        }
    }
    
    @objc func doneButtonAction() {
        login()
    }
    
    func setBorderForIdPassword() {
        idTextField.layer.borderWidth = 1
        idTextField.layer.borderColor = UIColor.lightGray.cgColor
        passTextField.layer.borderWidth = 1
        passTextField.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func configTextField() {
        idTextField.delegate = self
        passTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if isFirstRun {
            isFirstRun = false
        } else {
            if let passs = UserDefaults.standard.string(forKey: "pass") {
                pass = passs
            }
            messegeLabel.text = ""
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == idTextField {
            passTextField.becomeFirstResponder()
        } else if textField == passTextField {
            doneButtonAction()
        }
        return true
    }
}


