//
//  Ex1Name.swift
//  TableView
//
//  Created by PCI0008 on 8/19/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import Foundation

final class Ex1Name {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

extension Ex1Name {
    static func dummyData() -> [Ex1Name] {
        return [Ex1Name(name: "name 1"),
        Ex1Name(name: "name 2"),
        Ex1Name(name: "name 3"),
        Ex1Name(name: "name 4"),
        Ex1Name(name: "name 5"),
        Ex1Name(name: "name 6"),
        Ex1Name(name: "name 7"),
        Ex1Name(name: "name 8"),
        Ex1Name(name: "name 9"),
        Ex1Name(name: "name 10")]
    }
}
