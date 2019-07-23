//
//  ProfileViewController.swift
//  BaiTapNavigation
//
//  Created by PCI0013 on 7/18/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
 
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    var imageName = ""
    var username = ""
    var users: [Avatar] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(editUser))
        navigationItem.rightBarButtonItem = doneButton
        avatarImage.image = UIImage(named: imageName)
        usernameTextField.text = username
    }

    @objc func editUser() {
        guard let newUsername = usernameTextField.text else { return }
        let user = Avatar(newUsername, imageName)
        Manager.writePlistAvatar(user, username)
        self.navigationController?.popViewController(animated: true)
        AppDelegate.shared.movetoEx03()
    }
}
