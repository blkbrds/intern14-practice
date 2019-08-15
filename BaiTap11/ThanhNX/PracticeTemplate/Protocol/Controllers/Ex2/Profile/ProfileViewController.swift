//
//  ProfileViewController.swift
//  Protocol
//
//  Created by PCI0008 on 8/12/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

protocol ProfileViewControllerDelegate: class {
    func detailView(_ view: ProfileViewController, index: Int, avatar: Avatar)
}

final class ProfileViewController: UIViewController {

    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private weak var profileTextField: UITextField!
    
    var index: Int = 0
    var user: Avatar?
    
    weak var delegate: ProfileViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        
        if let user = user {
            profileImageView.image = UIImage(named: user.imageName)
            profileTextField.text = user.name
        }
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonDidClick))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc func doneButtonDidClick() {
        guard let user = user, let newName = profileTextField.text else { return }
        user.name = newName
        if let delegate = delegate {
            delegate.detailView(self, index: index, avatar: user)
        }
        navigationController?.popViewController(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
}

extension ProfileViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == profileTextField {
            doneButtonDidClick()
        }
        return true
    }
}
