//
//  User.swift
//  CustomView
//
//  Created by Nguyen Duong on 7/17/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import Foundation
class User {
    var name: String = ""
    var avatar: String = ""
    
    init(_ name: String, _ avatar: String) {
        self.name = name
        self.avatar = avatar
    }
}
extension User {
    static func parseData(array: [[String: String]]) -> [User] {
        var users: [User] = []
        
        for dic in array {
            let user = User(dic["name"]!, dic["avatar"]!)
            users.append(user)
        }
        
        return users
    }
}
