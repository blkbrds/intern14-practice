//
//  UserDetailViewController.swift
//  Navigation
//
//  Created by Nguyen Duong on 7/12/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {

    @IBOutlet private weak var userDetailImage: UIImageView!
    @IBOutlet private weak var userNameTextField: UITextField!

    var name = ""
    var avatar = ""
    var imageUser = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUIDetail()
        userDetailImage.image = imageUser
        userNameTextField.text = name
        let pictureTap = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        userDetailImage.addGestureRecognizer(pictureTap)
        userDetailImage.isUserInteractionEnabled = true
    }

    private func setUpUIDetail() {
        title = "Profile"
        let editButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 44))
        editButton.addTarget(self, action: #selector(done), for: .touchUpInside)
        editButton.setTitle("Done", for: .normal)
        editButton.setTitleColor(.blue, for: .normal)
        let rightCustomerView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 44))
        rightCustomerView.addSubview(editButton)
        let rightBarButtonItem = UIBarButtonItem(customView: rightCustomerView)
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }

    @objc private func done() {
        guard let newUserName = userNameTextField.text else {
            return
        }
        let user = Users(newUserName, avatar)
        FileManagers.writePlistToList(user, name)
        navigationController?.popViewController(animated: true)
    }

    @objc private func imageTapped(sender: UITapGestureRecognizer) {
        let listImage = ["image1", "image2", "image3", "image4", "image5", "image6"]
        let number = Int.random(in: 0 ..< listImage.count)
        userDetailImage.image = UIImage(named: listImage[number])
        avatar = listImage[number]
    }
}
