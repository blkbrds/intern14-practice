//
//  MyAvatarDetailViewController.swift
//  Protocol
//
//  Created by Nguyen Duong on 8/12/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

protocol MyAvatarDetailViewControllerDelegate {
    func detailView(_ view: MyAvatarDetailViewController, index: Int, user: Users)
}

class MyAvatarDetailViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var myAvatarImageView: UIImageView!

    //MARK: - Properties
    var delegate: MyAvatarDetailViewControllerDelegate?
    var index: Int = 0
    var user: Users = Users("", "")

    // MARK: - Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUIDetail()
    }

    // MARK: - Custom func
    private func setUpUIDetail() {
        title = "Profile"
        myAvatarImageView.image = UIImage(named: user.avatar)
        nameTextField.text = user.name
        let pictureTap = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        myAvatarImageView.addGestureRecognizer(pictureTap)
        myAvatarImageView.isUserInteractionEnabled = true
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
        guard let newUserName = nameTextField.text else {
            return
        }
        let newUser = Users(newUserName, user.avatar)
        let newIndex = index
        //
        if let delegate = delegate {
            delegate.detailView(self, index: newIndex, user: newUser)
        }
        navigationController?.popViewController(animated: true)
    }

    @objc private func imageTapped(sender: UITapGestureRecognizer) {
        let listImage = ["img1", "img2", "img3", "img4", "img5", "img6"]
        let number = Int.random(in: 0 ..< listImage.count)
        myAvatarImageView.image = UIImage(named: listImage[number])
        user.avatar = listImage[number]
    }
}
