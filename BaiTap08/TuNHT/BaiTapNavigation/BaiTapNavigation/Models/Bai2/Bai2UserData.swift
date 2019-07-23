//
//  UserData.swift
//  BaiTapNavigation
//
//  Created by PCI0001 on 7/11/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import Foundation

class Bai2UserData {
    var username = ""
    var password = ""
    
    init() {}
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}

extension Bai2UserData {
    static func parseData(array: [Dictionary<String, String>]) -> [Bai2UserData] {
        var users: [Bai2UserData] = []
        
        for dic in array {
            let user = Bai2UserData(username: dic["username"]!, password: dic["password"]!)
            users.append(user)
        }
        
        return users
    }
}
