//
//  ProfileViewController.swift
//  ExNavigation
//
//  Created by PCI0010 on 8/14/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var name = ""
    var avatar = ""
    var myAvatar = UIImage()
    var currentUser: Users?
    
    @IBOutlet private weak var userAvatar: UIImageView!
    @IBOutlet private weak var nameText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    @objc func doneButtonDidClick() {
        guard let newUserName = nameText.text, let user = currentUser else { return }
//        let user = Users(name: newUserName, avatar: avatar)
        DataManagement.share.writePlistToList(user: user, name: newUserName)
      
        
        navigationController?.popViewController(animated: true)
    }
    
    @objc func cancelButtonDidClick() {
        navigationController?.popViewController(animated: true)
    }
    
    func configUI() {
        title = "Profile"
        nameText.text = name
        userAvatar.image = myAvatar
        navigationController?.navigationBar.backgroundColor = .cyan
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonDidClick))
        navigationItem.rightBarButtonItem = doneButton
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(cancelButtonDidClick))
        navigationItem.leftBarButtonItem = cancelButton
    }
}
