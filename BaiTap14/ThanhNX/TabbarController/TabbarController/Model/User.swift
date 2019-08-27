//
//  Avatar.swift
//  TabbarController
//
//  Created by PCI0008 on 8/22/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import Foundation

final class User {
    var username = ""
    var password = ""
    
    init() {}
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}

extension User {
    static func parseData(array: [[String: String]]) -> [User] {
        var users: [User] = []
        
        for dic in array {
            guard let dicName = dic["username"], let dicPass = dic["password"] else { return [User]() }
            let user = User(username: dicName, password: dicPass)
            users.append(user)
        }
        
        return users
    }
}
