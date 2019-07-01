//
//  User.swift
//  BaiTap2
//
//  Created by Nguyen Duong on 7/1/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import Foundation
import UIKit

class User {
    var name: String = ""
    var avatar = UIImage()
    
    init(_ name: String, _ avatar: UIImage) {
        self.name = name
        self.avatar = avatar
    }
}
