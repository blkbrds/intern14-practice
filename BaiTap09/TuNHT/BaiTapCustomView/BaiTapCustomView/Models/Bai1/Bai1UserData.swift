//
//  Bai1UserData.swift
//  BaiTapCustomView
//
//  Created by PCI0001 on 7/22/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import Foundation

class Bai1UserData {
    var name: String = ""
    var avatar: String = ""
    
    init() {}
    
    init(_ name: String, _ avatar: String) {
        self.name = name
        self.avatar = avatar
    }
}

extension Bai1UserData {
    static func parseData(array: [Dictionary<String, String>]) -> [Bai1UserData] {
        var users: [Bai1UserData] = []
        
        for dic in array {
            let user = Bai1UserData(dic["name"]!, dic["avatar"]!)
            users.append(user)
        }
        
        return users
    }
}
