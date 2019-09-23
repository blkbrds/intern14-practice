//
//  User.swift
//  Navigation
//
//  Created by Nguyen Duong on 7/9/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import Foundation
import UIKit

class Users {
    var name: String = ""
    var avatar: String = ""
    
    init(_ name: String, _ avatar: String) {
        self.name = name
        self.avatar = avatar
    }
}

extension Users {
    static func parseData(array: [[String: String]]) -> [Users] {
        var users: [Users] = []
        for dic in array {
            let user = Users(dic["name"]!, dic["avatar"]!)
            users.append(user)
        }
        return users
    }
}
