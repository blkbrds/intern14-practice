//
//  UserData.swift
//  BaiTapNavigation
//
//  Created by PCI0013 on 7/15/19.
//  Copyright © 2019 PCI0013. All rights reserved.
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
