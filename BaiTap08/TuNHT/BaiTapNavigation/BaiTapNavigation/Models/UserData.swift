//
//  UserData.swift
//  BaiTapNavigation
//
//  Created by PCI0001 on 7/11/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import Foundation

class UserData {
    var username = ""
    var password = ""
    
    init() {}
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}

extension UserData {
    static func parseData(array: [[String: String]]) -> [UserData] {
        var users: [UserData] = []
        
        for dic in array {
            let user = UserData(username: dic["username"]!, password: dic["password"]!)
            users.append(user)
        }
        
        return users
    }
}
