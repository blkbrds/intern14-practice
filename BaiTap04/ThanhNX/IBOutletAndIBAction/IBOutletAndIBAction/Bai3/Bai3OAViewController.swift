//
//  Bai3OAViewController.swift
//  IBOutletAndIBAction
//
//  Created by PCI0008 on 6/25/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

class Bai3OAViewController: UIViewController {
    struct Config {
        static let nameWidth: CGFloat = 100
        static let nameHeight: CGFloat = 130
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var xFrame: CGFloat = 50
        var yFrame: CGFloat = UIScreen.main.bounds.height / 5
        for index in 0..<users.count {
            let frame = CGRect(x: xFrame, y: yFrame, width: Config.nameWidth, height: Config.nameHeight)
            let containerView = addAvatarView(frame: frame, name: users[index].name, avatarImage: users[index].avatar, tag: index)
            view.addSubview(containerView)            
            
            xFrame += 120
            if xFrame >= UIScreen.main.bounds.width - Config.nameWidth {
                xFrame = 50
                yFrame += 150
            }
        }
    }
    
    func addAvatarView(frame: CGRect, name: String, avatarImage: UIImage, tag: Int) -> UIView {
        let containerView = UIView(frame: frame)
        containerView.backgroundColor = .white
        
        let userAvatarImageView = UIImageView(image: avatarImage)
        userAvatarImageView.frame = CGRect(x: 0, y: 0, width: 90, height: 100)
        userAvatarImageView.contentMode = .scaleToFill
        containerView.addSubview(userAvatarImageView)
        
        let avatarImageButton = UIButton(frame: CGRect(x: 0, y: 0, width: 90, height: 100))
        avatarImageButton.backgroundColor = .clear
        avatarImageButton.addTarget(self, action: #selector(buttonDidClick), for: .touchUpInside)
        avatarImageButton.tag = tag
        containerView.addSubview(avatarImageButton)
        
        let userNameLabel = UILabel(frame: CGRect(x: 0, y: 100, width: 90, height: 30))
        userNameLabel.text = name
        userNameLabel.textAlignment = .center
        userNameLabel.backgroundColor = UIColor(red: 116 / 255, green: 185 / 255, blue: 255 / 255, alpha: 1)
        userNameLabel.textColor = .white
        containerView.addSubview(userNameLabel)
        
        return containerView
    }
    
    @objc private func buttonDidClick(_ button: UIButton) {
        print("\(users[button.tag].name)")
    }
}
