//
//  Avatar.swift
//  CustomView
//
//  Created by PCI0008 on 7/18/19.
//  Copyright © 2019 PCI0008. All rights reserved.
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

extension Avatar {
    static func parseImage(array: [[String: String]]) -> [Avatar] {
        var images: [Avatar] = []
        
        for dic in array {
            let image = Avatar(imageName: dic["avatar"]!, name: dic["name"]!)
            images.append(image)
        }
        
        return images
    }
}
