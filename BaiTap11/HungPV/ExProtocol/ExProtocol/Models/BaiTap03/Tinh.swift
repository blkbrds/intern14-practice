//
//  Tinh.swift
//  ExProtocol
//
//  Created by PCI0010 on 9/4/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import Foundation

final class Tinh {
    
    var name: String
    var huyen: [Huyen]
    
    init(name: String, huyen: [Huyen]) {
        self.name = name
        self.huyen = huyen
    }
}
