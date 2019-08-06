//
//  CustomAvatarView.swift
//  CustomView
//
//  Created by PCI0008 on 7/18/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

//MARK: Create delegate
protocol MyAvatarDelegate: class {
    func view(_ view: MyAvatar, needPerformAction action: MyAvatar.Action)
}

//MARK: CustomView
final class MyAvatar: UIView {
    enum Action {
        case getAvatar(avatar: Avatar)
    }
    
    private var userName = ""
    private var imageName = ""
    weak var delegate: MyAvatarDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(frame: CGRect, userName: String, imageName: String) {
        self.init(frame: frame)
        self.userName = userName
        self.imageName = imageName
        configView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
    
    //MARK: Config View
    private func configView() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height - 30))
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleToFill
        addSubview(imageView)
        
        let avatarImageButton = UIButton(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height - 30))
        avatarImageButton.backgroundColor = .clear
        avatarImageButton.addTarget(self, action: #selector(buttonDidClick), for: .touchUpInside)
        addSubview(avatarImageButton)
        
        let userNameLabel = UILabel(frame: CGRect(x: imageView.frame.origin.x, y: imageView.frame.maxY, width: frame.width, height: 30))
        userNameLabel.text = userName
        userNameLabel.textAlignment = .center
        userNameLabel.backgroundColor = UIColor(red: 116 / 255, green: 185 / 255, blue: 255 / 255, alpha: 1)
        userNameLabel.textColor = .white
        userNameLabel.clipsToBounds = true
        userNameLabel.layer.cornerRadius = 10
        addSubview(userNameLabel)
    }
    
    @objc private func buttonDidClick() {
        delegate?.view(self, needPerformAction: .getAvatar(avatar: Avatar(imageName: imageName, name: userName)))
    }
}
