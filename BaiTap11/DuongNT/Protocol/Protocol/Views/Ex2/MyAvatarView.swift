//
//  MyAvatarView.swift
//  Protocol
//
//  Created by Nguyen Duong on 8/12/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

protocol MyAvatarViewDelegate: class {
    func imageView(view: MyAvatarView, needPerform action: MyAvatarView.Action, index: Int)
}

class MyAvatarView: UIView {

    // MARK: - Enum
    enum Action {
        case selectedAvatar
    }

    // MARK: - Outlets
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    // MARK: - Properties
    var index = 0

    // MARK: - Properties
    weak var delegate: MyAvatarViewDelegate?

    // MARK: - Actions
    @IBAction func selectedAvatarTouchUpInside(_ button: UIButton) {
        if let delegate = delegate {
            delegate.imageView(view: self, needPerform: .selectedAvatar, index: index)
        }
    }
}
