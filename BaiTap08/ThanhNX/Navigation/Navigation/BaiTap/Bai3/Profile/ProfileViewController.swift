//
//  ProfileViewController.swift
//  Navigation
//
//  Created by PCI0008 on 7/12/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    @IBOutlet private var avatarImageView: UIImageView!
    @IBOutlet private weak var nameTextField: UITextField!
    var avatar1: Avatar = Avatar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile"
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonDidClick))
        
        navigationItem.rightBarButtonItem = doneButton
        nameTextField.text = "\(avatar1.name)"
        avatarImageView.image = UIImage(named: avatar1.imageName)
    }
    
    @objc private func doneButtonDidClick() {
        UserDefaults.standard.setValue(self.nameTextField.text, forKey: "name")
        UserDefaults.standard.synchronize()
        
        let avatars = Avatar.parseImage(array: FileManagers.readPlistFile(filename: "avatar"))
        for avatar in avatars {
            if avatar.imageName == avatar1.imageName {                
                avatar.name = nameTextField.text!
            }
        }
        var arrs: [[String: String]] = []
        
        for avatar in avatars {
            arrs.append(["avatar": avatar.imageName, "name": avatar.name])
        }
        
        FileManagers.writePlistFile(filename: "avatar.plist", data: arrs as NSArray)
        navigationController?.popViewController(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension ProfileViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            doneButtonDidClick()
        }
        return true
    }
}
