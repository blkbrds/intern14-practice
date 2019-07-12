//
//  User.swift
//  Navigation
//
//  Created by PCI0008 on 7/10/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import Foundation

class User {
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
            let user = User(username: dic["username"]!, password: dic["password"]!)
            users.append(user)
        }
        
        return users
    }
}
