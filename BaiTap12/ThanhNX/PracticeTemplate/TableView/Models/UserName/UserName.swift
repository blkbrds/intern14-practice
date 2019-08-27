//
//  Ex1Name.swift
//  TableView
//
//  Created by PCI0008 on 8/19/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import Foundation

final class UserName {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

extension UserName {
    static func dummyData() -> [UserName] {
        return [UserName(name: "name 1"),
        UserName(name: "name 2"),
        UserName(name: "name 3"),
        UserName(name: "name 4"),
        UserName(name: "name 5"),
        UserName(name: "name 6"),
        UserName(name: "name 7"),
        UserName(name: "name 8"),
        UserName(name: "name 9"),
        UserName(name: "name 10")]
    }
}
