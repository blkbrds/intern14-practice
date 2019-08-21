//
//  UserView.swift
//  Protocol
//
//  Created by PCI0008 on 8/12/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

protocol UserViewDelegate: class {
    func userView(_ view: UserView, needperformAction action: UserView.Action, index: Int)
}

class UserView: UIView {
    enum Action {
        case disSelected
    }
    
    weak var delegate: UserViewDelegate?
    var index = 0

    //MARK: Outlet
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBAction private func chooseButtonTouchUpInside(_ sender: Any) {
        if let delegate = delegate {            
            delegate.userView(self, needperformAction: .disSelected, index: index)
        }
    }
}
