//
//  Users.swift
//  TabBarController
//
//  Created by Nguyen Duong on 8/22/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import Foundation

class User {
    var username: String
    var password: String
    
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
