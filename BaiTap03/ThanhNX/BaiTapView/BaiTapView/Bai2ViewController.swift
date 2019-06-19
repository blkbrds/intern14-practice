//
//  Bai2ViewController.swift
//  BaiTapView
//
//  Created by PCI0008 on 6/17/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

class User {
    var name: String
    var avatar: UIImage

    init(name: String, avatar: UIImage) {
        self.name = name
        self.avatar = avatar
    }
}

class Bai2ViewController: UIViewController {
    
    var users: [User] = [
        User(name: "Thanh", avatar: #imageLiteral(resourceName: "img1")),
        User(name: "Thien", avatar: #imageLiteral(resourceName: "img2")),
        User(name: "Thoa", avatar: #imageLiteral(resourceName: "img7")),
        User(name: "Thao", avatar: #imageLiteral(resourceName: "img6")),
        User(name: "Thuy", avatar: #imageLiteral(resourceName: "img9")),
        User(name: "Thuong", avatar: #imageLiteral(resourceName: "img2")),
        User(name: "Thinh", avatar: #imageLiteral(resourceName: "img5")),
        User(name: "Thu", avatar: #imageLiteral(resourceName: "img3")),
        User(name: "Thong", avatar: #imageLiteral(resourceName: "img8"))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIScreen.main.bounds.width
        func prints() {
            for index in 0..<users.count {
                var x: Int
                var y: Int
                if index < 3 {
                    x = index * 100
                    y = 100
                } else if index < 6 {
                    x = (index - 3) * 100
                    y = 250
                } else {
                    x = (index - 6) * 100
                    y = 400
                }
                
                let frame = CGRect(x: x, y: y, width: 100, height: 130)
                let containerView = addAvatarView(frame: frame,
                                                  name: users[index].name,
                                                  avatarImage: users[index].avatar)
                view.addSubview(containerView)
            }
        }
        
        _ = prints()
    }
    
    func addAvatarView(frame: CGRect, name: String, avatarImage: UIImage) -> UIView {
        let containerView = UIView(frame: frame)
        containerView.backgroundColor = .white
        
        let userAvatarImageView = UIImageView(image: avatarImage)
        userAvatarImageView.frame = CGRect(x: 0, y: 0, width: 90, height: 100)
        userAvatarImageView.contentMode = .scaleToFill
        containerView.addSubview(userAvatarImageView)
        
        let userNameLabel = UILabel(frame: CGRect(x: 0, y: 100, width: 90, height: 30))
        userNameLabel.text = name
        userNameLabel.textAlignment = .center
        userNameLabel.backgroundColor = UIColor(red: 116/255, green: 185/255, blue: 255/255, alpha: 1)
        userNameLabel.textColor = .white
        containerView.addSubview(userNameLabel)
        
        return containerView
    }
}
