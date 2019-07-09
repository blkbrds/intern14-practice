//
//  DataUsers.swift
//  Navigation
//
//  Created by Nguyen Duong on 7/9/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import Foundation
import UIKit

class DataUsers {
    var username: String
    var password: String
    
    init(_ username: String, _ password: String) {
        self.username = username
        self.password = password
    }
}

class ListUser {
    var listUser = [DataUsers("duongnt", "duongnt123"),
                    DataUsers("duongnt1", "duongnt1"),
                    DataUsers("admin", "admin"),
                    DataUsers("abc123", "abc123")]
}
