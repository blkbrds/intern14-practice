//
//  Mien.swift
//  ExProtocol
//
//  Created by PCI0010 on 9/4/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import Foundation

final class Mien {
    
    var name: String
    var tinh: [Tinh]
    
    init(name: String, tinh: [Tinh]) {
        self.name = name
        self.tinh = tinh
    }
}

extension Mien {
    static func datas() -> [Mien] {
        let newMien: [Mien] = {
            let mien1 = Mien(name: "Mien 1", tinh: [Tinh(name: "Tinh 1", huyen: [Huyen(name: "Huyen 1"),
                                                                                 Huyen(name: "Huyen 2"),
                                                                                 Huyen(name: "Huyen 3"),
                                                                                 Huyen(name: "Huyen 4"),
                                                                                 Huyen(name: "Huyen 5")]),
                                                    Tinh(name: "Tinh 2", huyen: [Huyen(name: "Huyen 1"),
                                                                                 Huyen(name: "Huyen 2"),
                                                                                 Huyen(name: "Huyen 3"),
                                                                                 Huyen(name: "Huyen 4"),
                                                                                 Huyen(name: "Huyen 5")]),
                                                    Tinh(name: "Tinh 3", huyen: [Huyen(name: "Huyen 1"),
                                                                                 Huyen(name: "Huyen 2"),
                                                                                 Huyen(name: "Huyen 3"),
                                                                                 Huyen(name: "Huyen 4"),
                                                                                 Huyen(name: "Huyen 5")]),
                                                    Tinh(name: "Tinh 4", huyen: [Huyen(name: "Huyen 1"),
                                                                                 Huyen(name: "Huyen 2"),
                                                                                 Huyen(name: "Huyen 3"),
                                                                                 Huyen(name: "Huyen 4"),
                                                                                 Huyen(name: "Huyen 5")]),
                                                    Tinh(name: "Tinh 5", huyen: [Huyen(name: "Huyen 1"),
                                                                                 Huyen(name: "Huyen 2"),
                                                                                 Huyen(name: "Huyen 3"),
                                                                                 Huyen(name: "Huyen 4"),
                                                                                 Huyen(name: "Huyen 5")])])
            let mien2 = Mien(name: "Mien 2", tinh: [Tinh(name: "Tinh 1", huyen: [Huyen(name: "Huyen 1"),
                                                                                 Huyen(name: "Huyen 2"),
                                                                                 Huyen(name: "Huyen 3"),
                                                                                 Huyen(name: "Huyen 4"),
                                                                                 Huyen(name: "Huyen 5")]),
                                                    Tinh(name: "Tinh 2", huyen: [Huyen(name: "Huyen 1"),
                                                                                 Huyen(name: "Huyen 2"),
                                                                                 Huyen(name: "Huyen 3"),
                                                                                 Huyen(name: "Huyen 4"),
                                                                                 Huyen(name: "Huyen 5")]),
                                                    Tinh(name: "Tinh 3", huyen: [Huyen(name: "Huyen 1"),
                                                                                 Huyen(name: "Huyen 2"),
                                                                                 Huyen(name: "Huyen 3"),
                                                                                 Huyen(name: "Huyen 4"),
                                                                                 Huyen(name: "Huyen 5")]),
                                                    Tinh(name: "Tinh 4", huyen: [Huyen(name: "Huyen 1"),
                                                                                 Huyen(name: "Huyen 2"),
                                                                                 Huyen(name: "Huyen 3"),
                                                                                 Huyen(name: "Huyen 4"),
                                                                                 Huyen(name: "Huyen 5")]),
                                                    Tinh(name: "Tinh 5", huyen: [Huyen(name: "Huyen 1"),
                                                                                 Huyen(name: "Huyen 2"),
                                                                                 Huyen(name: "Huyen 3"),
                                                                                 Huyen(name: "Huyen 4"),
                                                                                 Huyen(name: "Huyen 5")])])
            let mien3 = Mien(name: "Mien 3", tinh: [Tinh(name: "Tinh 1", huyen: [Huyen(name: "Huyen 1"),
                                                                                 Huyen(name: "Huyen 2"),
                                                                                 Huyen(name: "Huyen 3"),
                                                                                 Huyen(name: "Huyen 4"),
                                                                                 Huyen(name: "Huyen 5")]),
                                                    Tinh(name: "Tinh 2", huyen: [Huyen(name: "Huyen 1"),
                                                                                 Huyen(name: "Huyen 2"),
                                                                                 Huyen(name: "Huyen 3"),
                                                                                 Huyen(name: "Huyen 4"),
                                                                                 Huyen(name: "Huyen 5")]),
                                                    Tinh(name: "Tinh 3", huyen: [Huyen(name: "Huyen 1"),
                                                                                 Huyen(name: "Huyen 2"),
                                                                                 Huyen(name: "Huyen 3"),
                                                                                 Huyen(name: "Huyen 4"),
                                                                                 Huyen(name: "Huyen 5")]),
                                                    Tinh(name: "Tinh 4", huyen: [Huyen(name: "Huyen 1"),
                                                                                 Huyen(name: "Huyen 2"),
                                                                                 Huyen(name: "Huyen 3"),
                                                                                 Huyen(name: "Huyen 4"),
                                                                                 Huyen(name: "Huyen 5")]),
                                                    Tinh(name: "Tinh 5", huyen: [Huyen(name: "Huyen 1"),
                                                                                 Huyen(name: "Huyen 2"),
                                                                                 Huyen(name: "Huyen 3"),
                                                                                 Huyen(name: "Huyen 4"),
                                                                                 Huyen(name: "Huyen 5")])])
            let mien4 = Mien(name: "Mien 4", tinh: [Tinh(name: "Tinh 1", huyen: [Huyen(name: "Huyen 1"),
                                                                                 Huyen(name: "Huyen 2"),
                                                                                 Huyen(name: "Huyen 3"),
                                                                                 Huyen(name: "Huyen 4"),
                                                                                 Huyen(name: "Huyen 5")]),
                                                    Tinh(name: "Tinh 2", huyen: [Huyen(name: "Huyen 1"),
                                                                                 Huyen(name: "Huyen 2"),
                                                                                 Huyen(name: "Huyen 3"),
                                                                                 Huyen(name: "Huyen 4"),
                                                                                 Huyen(name: "Huyen 5")]),
                                                    Tinh(name: "Tinh 3", huyen: [Huyen(name: "Huyen 1"),
                                                                                 Huyen(name: "Huyen 2"),
                                                                                 Huyen(name: "Huyen 3"),
                                                                                 Huyen(name: "Huyen 4"),
                                                                                 Huyen(name: "Huyen 5")]),
                                                    Tinh(name: "Tinh 4", huyen: [Huyen(name: "Huyen 1"),
                                                                                 Huyen(name: "Huyen 2"),
                                                                                 Huyen(name: "Huyen 3"),
                                                                                 Huyen(name: "Huyen 4"),
                                                                                 Huyen(name: "Huyen 5")]),
                                                    Tinh(name: "Tinh 5", huyen: [Huyen(name: "Huyen 1"),
                                                                                 Huyen(name: "Huyen 2"),
                                                                                 Huyen(name: "Huyen 3"),
                                                                                 Huyen(name: "Huyen 4"),
                                                                                 Huyen(name: "Huyen 5")])])
            let mien5 = Mien(name: "Mien 5", tinh: [Tinh(name: "Tinh 1", huyen: [Huyen(name: "Huyen 1"),
                                                                                 Huyen(name: "Huyen 2"),
                                                                                 Huyen(name: "Huyen 3"),
                                                                                 Huyen(name: "Huyen 4"),
                                                                                 Huyen(name: "Huyen 5")]),
                                                    Tinh(name: "Tinh 2", huyen: [Huyen(name: "Huyen 1"),
                                                                                 Huyen(name: "Huyen 2"),
                                                                                 Huyen(name: "Huyen 3"),
                                                                                 Huyen(name: "Huyen 4"),
                                                                                 Huyen(name: "Huyen 5")]),
                                                    Tinh(name: "Tinh 3", huyen: [Huyen(name: "Huyen 1"),
                                                                                 Huyen(name: "Huyen 2"),
                                                                                 Huyen(name: "Huyen 3"),
                                                                                 Huyen(name: "Huyen 4"),
                                                                                 Huyen(name: "Huyen 5")]),
                                                    Tinh(name: "Tinh 4", huyen: [Huyen(name: "Huyen 1"),
                                                                                 Huyen(name: "Huyen 2"),
                                                                                 Huyen(name: "Huyen 3"),
                                                                                 Huyen(name: "Huyen 4"),
                                                                                 Huyen(name: "Huyen 5")]),
                                                    Tinh(name: "Tinh 5", huyen: [Huyen(name: "Huyen 1"),
                                                                                 Huyen(name: "Huyen 2"),
                                                                                 Huyen(name: "Huyen 3"),
                                                                                 Huyen(name: "Huyen 4"),
                                                                                 Huyen(name: "Huyen 5")])])
           
            return [mien1,mien2,mien3,mien4,mien5]
        }()
        return newMien
    }
}
