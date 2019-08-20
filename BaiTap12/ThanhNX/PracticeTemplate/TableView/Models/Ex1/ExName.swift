//
//  Ex1Name.swift
//  TableView
//
//  Created by PCI0008 on 8/19/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import Foundation

final class ExName {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

extension ExName {
    static func dummyData() -> [ExName] {
        return [ExName(name: "name 1"),
        ExName(name: "name 2"),
        ExName(name: "name 3"),
        ExName(name: "name 4"),
        ExName(name: "name 5"),
        ExName(name: "name 6"),
        ExName(name: "name 7"),
        ExName(name: "name 8"),
        ExName(name: "name 9"),
        ExName(name: "name 10")]
    }
}
