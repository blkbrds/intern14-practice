//
//  User.swift
//  Navigation
//
//  Created by MBA0217 on 9/19/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import Foundation
import UIKit

class User {
    var name: String
    var avatar: String
    
    init(name: String, avatar: String) {
        self.name = name
        self.avatar = avatar
    }
}

extension User {
    static func parsingData() -> [User] {
        guard let path = Bundle.main.url(forResource: "UsersList", withExtension: ".plist") else {
            fatalError("Missing Users.plist file in Application bundle")
        }
        guard let array = NSArray(contentsOf: path) as? [[String: Any]] else {
            fatalError("Users.plist content is wrong format")
        }
        
        var users: [User] = []
        for item in array {
            if let name = item["name"] as? String, let avatar = item["avatar"] as? String {
                let user = User(name: name, avatar: avatar)
                users.append(user)
            }
        }
        return users
    }
}
