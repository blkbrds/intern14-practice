//
//  RegisterViewController.swift
//  ExTabbar
//
//  Created by PCI0010 on 9/9/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var newUserNameLabel: UITextField!
    @IBOutlet weak var newPasswordLabel: UITextField!
    @IBOutlet weak var submitLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI() 
    }
    
    func configUI() {
        title = "Register"
        self.submitLabel.layer.cornerRadius = 10
    }
    
    @IBAction func submitButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
   
}
