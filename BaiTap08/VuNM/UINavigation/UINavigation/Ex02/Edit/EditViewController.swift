//
//  LoginViewController.swift
//  DemoNavi
//
//  Created by PCI0007 on 7/10/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var newPassTextField: UITextField!
    @IBOutlet weak var confirmPassTextField: UITextField!
    @IBOutlet weak var messegeLabel2: UILabel!
   
    let login = LoginViewController()
    var userArray: [[String: String]] = []
    var user: [UserData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButton()
        config()
    }
    
    func setButton() {
        let logout = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(cancelButton))
        let edit = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButton2))
        navigationItem.leftBarButtonItem = logout
        navigationItem.rightBarButtonItem = edit
    }
    
    func config() {
        idTextField.delegate = self
        newPassTextField.delegate = self
        confirmPassTextField.delegate = self
    }
    
    @objc func cancelButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func doneButton2() {
        let pathForPlist = HandlePlist.shared.plistInDocument
            if newPassTextField.text == confirmPassTextField.text {
                var arr = NSArray(contentsOfFile: pathForPlist) as? [[String:String]]
                user = UserData.parseDataOfIDAndPass(array: arr!)
                guard let id = UserDefaults.standard.string(forKey: "id") else { return }
                for i in 0..<user.count {
                    if id == idTextField.text {
                        if user[i].pass == confirmPassTextField.text {
                            messegeLabel2.text = "New password must be different from old password"
                        } else {
                            arr?[i]["pass"] = confirmPassTextField.text
                            let userArray2 = arr! as NSArray
                            userArray2.write(toFile: pathForPlist, atomically: true)
                            navigationController?.popViewController(animated: true)
                            return
                        }
                    } else {
                        messegeLabel2.text = "Invalid user"
                           }
                }
            }  else if newPassTextField.text != confirmPassTextField.text {
                messegeLabel2.text = "Password does not match"
            }
    }
}

extension EditViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == idTextField {
            newPassTextField.becomeFirstResponder()
        } else if textField == newPassTextField {
            confirmPassTextField.becomeFirstResponder()
        } else {
            doneButton2()
        }
        return true
    }
}

