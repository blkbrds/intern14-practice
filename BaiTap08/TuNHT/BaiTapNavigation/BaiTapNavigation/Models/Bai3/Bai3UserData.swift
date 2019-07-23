//
//  Bai3UserData.swift
//  BaiTapNavigation
//
//  Created by PCI0001 on 7/17/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import Foundation

class Bai3UserData {
    var name: String = ""
    var avatar: String = ""
    
    init() {}

    init(_ name: String, _ avatar: String) {
        self.name = name
        self.avatar = avatar
    }
}

extension Bai3UserData {
    static func parseData(array: [Dictionary<String, String>]) -> [Bai3UserData] {
        var users: [Bai3UserData] = []
        
        for dic in array {
            let user = Bai3UserData(dic["name"]!, dic["avatar"]!)
            users.append(user)
        }
        
        return users
    }
}
