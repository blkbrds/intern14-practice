//
//  ListUsersViewController.swift
//  BaiTap2
//
//  Created by Nguyen Duong on 7/1/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class ListUsersViewController: UIViewController {

    var users: [User] = [
        User("Name 1", UIImage(imageLiteralResourceName: "avatar")),
        User("Name 2", UIImage(imageLiteralResourceName: "avatar")),
        User("Name 3", UIImage(imageLiteralResourceName: "avatar")),
        User("Name 4", UIImage(imageLiteralResourceName: "avatar")),
        User("Name 5", UIImage(imageLiteralResourceName: "avatar")),
        User("Name 6", UIImage(imageLiteralResourceName: "avatar")),
        User("Name 7", UIImage(imageLiteralResourceName: "avatar")),
        User("Name 8", UIImage(imageLiteralResourceName: "avatar")),
        User("Name 9", UIImage(imageLiteralResourceName: "avatar")),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        showListAvatar()
    }

    @objc private func didClickButton(_ button: UIButton) {
        print("\(users[button.tag].name)")
    }

    private func setAvatar(frame: CGRect, name: String, avatarImage: UIImage, tag: Int) -> UIView {
        let views = UIView(frame: frame)
        views.backgroundColor = .black

        let userAvatar = UIImageView(image: avatarImage)
        userAvatar.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        userAvatar.contentMode = .scaleToFill
        views.addSubview(userAvatar)
        
        let userName = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        userName.text = name
        userName.textAlignment = .center
        userName.backgroundColor = .lightGray
        userName.textColor = .blue
        views.addSubview(userName)

        let avatarImageButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        avatarImageButton.backgroundColor = .clear
        avatarImageButton.addTarget(self, action: #selector(didClickButton), for: .touchUpInside)
        avatarImageButton.tag = tag
        views.addSubview(avatarImageButton)
        
        return views
    }

    private func showListAvatar() {
        var x: CGFloat = 20
        var y: CGFloat = 50
        for index in 0..<users.count {
            if (x + 120) >= UIScreen.main.bounds.width {
                x = 20
                y += 130 + 20
            }
            let frame =  CGRect(x: x, y: y, width: 100 , height: 130 )
            x += 120
            let views = setAvatar(frame: frame, name: users[index].name, avatarImage: users[index].avatar, tag: index)
            view.addSubview(views)
        }
    }
    
}
