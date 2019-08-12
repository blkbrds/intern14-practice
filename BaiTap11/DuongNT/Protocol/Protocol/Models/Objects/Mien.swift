//
//  Mien.swift
//  Protocol
//
//  Created by Nguyen Duong on 8/12/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
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
