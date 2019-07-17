//
//  AvatarImageView.swift
//  Navigation
//
//  Created by PCI0008 on 7/16/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

//MARK: Create delegate
protocol CustomAvataViewDelegate: class {
    func view(_ view: CustomAvataView, needPerformAction action: CustomAvataView.Action)
}

//MARK: CustomView
final class CustomAvataView: UIView {
    enum Action {
        case getName(avatar: Avatar)
    }
    
    private var userName = ""
    private var imageName = ""
    private var tags: Int = 0
    weak var delegate: CustomAvataViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(frame: CGRect, userName: String, imageName: String, tags: Int) {
        self.init(frame: frame)
        self.userName = userName
        self.imageName = imageName
        self.tags = tags
        configView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configView() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height - 30))
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleToFill
        addSubview(imageView)
        
        let avatarImageButton = UIButton(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height - 30))
        avatarImageButton.backgroundColor = .clear
        avatarImageButton.addTarget(self, action: #selector(buttonDidClick), for: .touchUpInside)
        avatarImageButton.tag = tags
        addSubview(avatarImageButton)
        
        let userNameLabel = UILabel(frame: CGRect(x: imageView.frame.origin.x, y: imageView.frame.maxY, width: frame.width, height: 30))
        userNameLabel.text = userName
        userNameLabel.textAlignment = .center
        userNameLabel.backgroundColor = UIColor(red: 116 / 255, green: 185 / 255, blue: 255 / 255, alpha: 1)
        userNameLabel.textColor = .white
        addSubview(userNameLabel)
    }
    
    @objc private func buttonDidClick() {
        delegate?.view(self, needPerformAction: .getName(avatar: Avatar(imageName: imageName, name: userName)))
    }
}

