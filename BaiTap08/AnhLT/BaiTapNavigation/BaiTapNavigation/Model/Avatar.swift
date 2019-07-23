//
//  Avatar.swift
//  BaiTapNavigation
//
//  Created by PCI0013 on 7/18/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import Foundation

class Avatar {
    var userImage = ""
    var username = ""
    
    init() {}   
    
    init(_ username: String,_ userImage: String) {
        self.userImage = userImage
        self.username = username
    }
}

extension Avatar {
    static func parseData(array: [[String: String]]) -> [Avatar] {
        var users: [Avatar] = []
        
        for dic in array {
            let user = Avatar(dic["username"]!, dic["avatar"]!)
            users.append(user)
        }
        return users
    }
}
