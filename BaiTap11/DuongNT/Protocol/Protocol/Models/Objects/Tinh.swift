//
//  Tinh.swift
//  Protocol
//
//  Created by Nguyen Duong on 8/12/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
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
