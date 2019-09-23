//
//  UserView.swift
//  Navigation
//
//  Created by MBA0217 on 9/23/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import Foundation
import UIKit

final class UserView: UIView {
    var nameLabel : UILabel!
    var avatarImageView: UIImageView!
    private var user: User
    
    init(frame: CGRect, user: User) {
        self.user = user
        super.init(frame: frame)
        createView()
    }
    
    private func createView() {
        nameLabel = UILabel(frame: CGRect(x: 0, y: 130, width: 120, height: 30))
        nameLabel.textAlignment = .center
        nameLabel.backgroundColor = UIColor(red: 0, green: 163 / 255, blue: 1, alpha: 1)
        nameLabel.textColor = .white
        avatarImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 120, height: 130))
        avatarImageView!.image = UIImage(named: user.avatar)
        nameLabel!.text = user.name
        addSubview(nameLabel)
        addSubview(avatarImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
