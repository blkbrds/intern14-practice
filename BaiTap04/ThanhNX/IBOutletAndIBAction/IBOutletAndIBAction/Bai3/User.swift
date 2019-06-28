//
//  User.swift
//  IBOutletAndIBAction
//
//  Created by PCI0008 on 6/27/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

final class User {
    var name: String
    var avatar: UIImage
    
    init(name: String, avatar: UIImage) {
        self.name = name
        self.avatar = avatar
    }
}

var users: [User] = [
    User(name: "Thanh", avatar: #imageLiteral(resourceName: "img1")),
    User(name: "Thien", avatar: #imageLiteral(resourceName: "img2")),
    User(name: "Thoa", avatar: #imageLiteral(resourceName: "img7")),
    User(name: "Thao", avatar: #imageLiteral(resourceName: "img6")),
    User(name: "Thuy", avatar: #imageLiteral(resourceName: "img9")),
    User(name: "Thuong", avatar: #imageLiteral(resourceName: "img2")),
    User(name: "Thinh", avatar: #imageLiteral(resourceName: "img5")),
    User(name: "Thu", avatar: #imageLiteral(resourceName: "img3")),
    User(name: "Thong", avatar: #imageLiteral(resourceName: "img8"))]
