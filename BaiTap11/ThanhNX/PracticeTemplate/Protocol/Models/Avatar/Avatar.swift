//
//  Avatar.swift
//  Protocol
//
//  Created by PCI0008 on 8/12/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import Foundation

final class Avatar {
    var imageName: String = ""
    var name: String = ""
    
    init() {}
    
    init(imageName: String, name: String) {
        self.imageName = imageName
        self.name = name
    }
}
