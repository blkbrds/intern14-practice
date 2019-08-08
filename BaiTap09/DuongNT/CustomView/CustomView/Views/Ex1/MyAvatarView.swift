//
//  MyAvatar.swift
//  CustomView
//
//  Created by Nguyen Duong on 7/17/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

protocol MyAvatarViewDelegate: class {

    func view(_ view: MyAvatarView, needPerformAction action: MyAvatarView.Action)
}

class MyAvatarView: UIView {

    // MARK: - properties
    enum Action {
        case selectAvatar(atIndex: Int)
    }

    var userAvatar: UIImageView?
    var userName: UILabel?
    var button: UIButton?

    weak var delegate: MyAvatarViewDelegate?

    // MARK: - lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)

        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        userAvatar = UIImageView(image: UIImage(named: "avatar"))
        userAvatar?.frame = frame
        userAvatar?.contentMode = .scaleToFill
        if let userAvatar = userAvatar {
            addSubview(userAvatar)
        }

        userName = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 50))
        userName?.text = "User name"
        userName?.textAlignment = .center
        userName?.backgroundColor = .lightGray
        userName?.textColor = .blue
        if let userName = userName {
            addSubview(userName)
        }
        
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

    // MARK: - custom func
    @objc func buttonClicked(_ button: UIButton) {
        delegate?.view(self, needPerformAction: .selectAvatar(atIndex: button.tag))
    }
}
