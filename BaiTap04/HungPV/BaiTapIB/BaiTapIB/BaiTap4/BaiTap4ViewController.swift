//
//  BaiTap4ViewController.swift
//  BaiTapIB
//
//  Created by PCI0010 on 7/30/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

struct UserData {
    static let username: String = "Admin"
    static let password: String = "Admin123"
}

class BaiTap4ViewController: UIViewController {
    //Mark: - Outlet
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var pwTxt: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 20
        clearButton.layer.cornerRadius = 20
        nameTxt.layer.borderWidth = 0.5
        nameTxt.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        pwTxt.layer.borderWidth = 0.5
        pwTxt.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        nameTxt.returnKeyType = UIReturnKeyType.next
        pwTxt.returnKeyType = UIReturnKeyType.done
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func checkLogin() {
        if let username = nameTxt.text , let password = pwTxt.text {
            if username.isEmpty || password.isEmpty {
                errorLabel.text = " Hãy nhập Username và Mật Khẩu ! "
                errorLabel.isHidden = false
            } else {
                if username == UserData.username && password == UserData.password {
                    errorLabel.isHidden = true
                } else {
                    if username != UserData.username && password != UserData.password {
                        errorLabel.text = " Nhập sai username và password !! "
                        errorLabel.isHidden = false
                    }
                }
            }
        }
    }
    
    //Mark: - Action
    @IBAction func loginButton(_ sender: Any) {
        checkLogin()
    }
    @IBAction func clearButton(_ sender: Any) {
        nameTxt.text?.removeAll()
        pwTxt.text?.removeAll()
    }
    
    
}
extension BaiTap4ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTxt {
            pwTxt.becomeFirstResponder()
        } else if textField == pwTxt {
            checkLogin()
        }
        return true
    }
}

