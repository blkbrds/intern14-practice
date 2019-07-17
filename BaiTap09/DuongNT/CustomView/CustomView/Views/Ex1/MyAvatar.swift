//
//  MyAvatar.swift
//  CustomView
//
//  Created by Nguyen Duong on 7/17/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

protocol MyAvatarDelegate: class {
    func userView(_ userView: MyAvatar, didSelect index: Int)
}

class MyAvatar: UIView {
    var userAvatar: UIImageView?
    var userName: UILabel?
    var button: UIButton?

    // Khai bao thuoc tinh cua class custom view vs du lieu la protocol
    weak var delegate: MyAvatarDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Add user avatar
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        userAvatar = UIImageView(image: UIImage(named: "avatar"))
        userAvatar?.frame = frame
        userAvatar?.contentMode = .scaleToFill
        if let userAvatar = userAvatar {
            addSubview(userAvatar)
        }
   
        // Add username
        userName = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 50))
        userName?.text = "User name"
        userName?.textAlignment = .center
        userName?.backgroundColor = .lightGray
        userName?.textColor = .blue
        if let userName = userName {
            addSubview(userName)
        }
        
        // Add button
        button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 150))
        button?.backgroundColor = .clear
        button?.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        if let button = button {
            addSubview(button)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonClicked(_ sender: UIButton) {
        print("Button is pressed")
        delegate?.userView(self, didSelect: sender.tag)
    }
}
