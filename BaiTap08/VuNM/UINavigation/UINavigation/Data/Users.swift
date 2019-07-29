//
//  Users.swift
//  DemoNavi
//
//  Created by PCI0007 on 7/19/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

protocol UserViewDelegate: class {
    
    func view(_ view: UserView, needPerformAction action: UserView.Action)
}

class UserView: UIView {
    
    enum Action {
        case pushToUserDetail
        case printTag(tag: Int)
    }
    
    weak var delegate: UserViewDelegate?

    init(_ frame: CGRect, _ name: String, _ userImage: UIImage, tag: Int) {
        super.init(frame: frame)
        let avatar = UIImageView(image: userImage)
        addSubview(avatar)
        avatar.frame = CGRect(x: 0, y: 0, width: frame.width,  height: 100)
        avatar.contentMode = .scaleToFill
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        self.backgroundColor = .white
        self.addSubview(avatar)
        let userName = UILabel(frame: CGRect(x: 0, y: 100, width: frame.width, height: 20))
        userName.text = name
        userName.textAlignment = .center
        userName.textColor = .blue
        userName.layer.borderWidth = 1
        userName.layer.borderColor = UIColor.black.cgColor
        self.addSubview(userName)
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        button.tag = tag
        self.addSubview(button)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tap(_ sender: UIButton) {
        delegate?.view(self, needPerformAction: .pushToUserDetail)
        print(sender.tag)
        UserDefaults.standard.set(sender.tag, forKey: "tag")
    }
}
