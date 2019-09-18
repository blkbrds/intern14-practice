//
//  ForgotViewController.swift
//  ExTabbar
//
//  Created by PCI0010 on 9/9/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class ForgotViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var submitLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }

    func configUI() {
        title = " Forgot "
        self.submitLabel.layer.cornerRadius = 10
    }

    @IBAction func submitButton(_ sender: Any) {
        AppDelegate.shared.pushViewController(controllers: .tabBar)
    }
}
