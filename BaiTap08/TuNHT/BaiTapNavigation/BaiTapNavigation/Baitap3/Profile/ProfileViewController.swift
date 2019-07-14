//
//  ProfileViewController.swift
//  BaiTapNavigation
//
//  Created by PCI0001 on 7/12/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet private weak var usernameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        navigationItem.rightBarButtonItem = doneBarButton
    }
    
    @objc func done() {
        
    }
}
