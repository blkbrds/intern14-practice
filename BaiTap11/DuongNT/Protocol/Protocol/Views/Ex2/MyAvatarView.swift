//
//  MyAvatarView.swift
//  Protocol
//
//  Created by Nguyen Duong on 8/12/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

protocol MyAvatarViewDelegate: class {
    func imageView(view: MyAvatarView, needPerform action: MyAvatarView.Action)
}

class MyAvatarView: UIView {

    // MARK: - Enum
    enum Action {
        case selectedAvatar(atIndex: Int)
    }

    // MARK: - Outlets
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var selectedButtonIndex: UIButton!

    // MARK: - Properties
    weak var delegate: MyAvatarViewDelegate?

    // MARK: - Actions
    @IBAction func selectedAvatarTouchUpInside(_ button: UIButton) {
        if let delegate = delegate {
            delegate.imageView(view: self, needPerform: .selectedAvatar(atIndex: button.tag))
        }
    }
}
