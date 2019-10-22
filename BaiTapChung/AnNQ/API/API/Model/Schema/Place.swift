//
//  Place.swift
//  API
//
//  Created by MBA0217 on 10/21/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import Foundation


final class Place {
    var avatar: String?
    var name: String
    var address: String?
    var rating: Int?
    var distance: Int?
    
    init(avatar: String?, name: String, address: String?, rating: Int?, distance: Int?) {
        self.avatar = avatar
        self.name = name
        self.address = address
        self.rating = rating
        self.distance = distance
    }
}
