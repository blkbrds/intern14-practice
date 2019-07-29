
//
//  UserData.swift
//  DemoNavi
//
//  Created by PCI0007 on 7/12/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import Foundation

class UserData {
    var id: String = ""
    var pass: String = ""
    
    init() {}
    
    init(id: String, pass: String) {
        self.id = id
        self.pass = pass
    }
}

extension UserData {
    static func parseDataOfIDAndPass(array: [[String: String]]) -> [UserData] {
        var users: [UserData] = []
        
        for dic in array {
            let user = UserData(id: dic["id"]!, pass: dic["pass"]!)
            users.append(user)
        }
        
        return users
    }
}

class UserNameAndAvatar {
    var name: String = ""
    var image: String = ""
    
    init() { }
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
        
    }
}

extension UserNameAndAvatar {
    static func parseDataOfNameAndAvatar(_ array: [[String: String]]) -> [UserNameAndAvatar] {
        var users: [UserNameAndAvatar] = []
        for i in array {
            let user = UserNameAndAvatar(name: i["name"]!, image: i["image"]!)
            users.append(user)
        }
        return users
    }
}
