//
//  MyAvatarView.swift
//  ExCustomView
//
//  Created by PCI0010 on 8/19/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

protocol MyAvatarDelegate: class {
    func avatarView(_ view: MyAvatarView, needPerformAction action: MyAvatarView.Action)
}

final class MyAvatarView: UIView {
    
    enum Action {
        case getAvatar(atIndex: Int)
    }
    
    var userAvatar: UIImageView?
    var userName: UILabel?
    var button: UIButton?
    weak var delegate: MyAvatarDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let frame = CGRect(x: 0, y: 0, width: 80, height: 100)
        userAvatar = UIImageView(image: UIImage(named: "avatar"))
        userAvatar?.frame = frame
        userAvatar?.contentMode = .scaleToFill
        if let userAvatar = userAvatar {
            addSubview(userAvatar)
        }
        
        userName = UILabel(frame: CGRect(x: 0, y: 100, width: 80, height: 50))
        userName?.text = "name"
        userName?.textAlignment = .center
        userName?.backgroundColor = .lightGray
        userName?.textColor = .blue
        if let userName = userName {
            addSubview(userName)
        }
        
        button = UIButton(frame: CGRect(x: 0, y: 0, width: 80, height: 150))
        button?.backgroundColor = .clear
        button?.addTarget(self, action: #selector(buttonDidClick), for: .touchUpInside)
        if let button = button {
            addSubview(button)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonDidClick(_ button: UIButton) {
        delegate?.avatarView(self, needPerformAction: .getAvatar(atIndex: button.tag))
    }
    
}
