//
//  Place.swift
//  CollectionView
//
//  Created by MBA0217 on 10/15/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import Foundation
import UIKit

struct Place {
    let name: String
    let address: String
    let distance: Int
    let point: Int
    let image: String
    var favorite: Bool = false
    
    init(name: String, address: String, point: Int, distance: Int, image: String) {
        self.name = name
        self.address = address
        self.point = point
        self.distance = distance
        self.image = image
    }
}
