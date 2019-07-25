//
//  MyAvatarView.swift
//  BaiTapCustomView
//
//  Created by PCI0001 on 7/22/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

protocol MyAvatarDelegate: class {
    func myAvatarView(_ myAvatar: MyAvatar)
}

class MyAvatar: UIView {
    var userName: UILabel?
    var userAvatar: UIImageView?
    weak var delegate: MyAvatarDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Add user avatar
        userAvatar = UIImageView(image: UIImage(named: "ronaldo"))
        userAvatar?.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        userAvatar?.contentMode = .scaleToFill
        addSubview(userAvatar!)
        
        // Add user name
        userName = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 25))
        userName?.text = "ronaldo"
        userName?.textAlignment = .center
        userName?.backgroundColor = .gray
        userName?.textColor = .white
        addSubview(userName!)
        
        // Add button
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(avatarButtonTouchUpInside), for: .touchUpInside)
        addSubview(button)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func avatarButtonTouchUpInside() {
        delegate?.myAvatarView(self)
    }
}
