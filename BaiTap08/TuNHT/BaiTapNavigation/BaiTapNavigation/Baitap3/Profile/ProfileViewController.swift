//
//  ProfileViewController.swift
//  BaiTapNavigation
//
//  Created by PCI0001 on 7/12/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

protocol ProfileViewControllerDelegate: class {
    func editProfile(user: Bai3UserData)
}

class ProfileViewController: UIViewController {

    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet weak var avatarImageView: UIImageView!
    var user: Bai3UserData = Bai3UserData()
    var users: [Bai3UserData] = []
    
    weak var delegate: ProfileViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        usernameTextField.text = user.name
        avatarImageView.image = UIImage(imageLiteralResourceName: user.avatar)
        
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        navigationItem.rightBarButtonItem = doneBarButton
    }
    
    @objc func done() {
        guard let name = usernameTextField.text else { return }
        user.name = name
        Bai3Manager().saveDataToDocument(users)
        delegate?.editProfile(user: user)
        navigationController?.popViewController(animated: true)
    }
}
