//
//  DiaDiemDuLich.swift
//  ExCollectionViewHomeScreen
//
//  Created by PCI0010 on 9/12/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import Foundation
import UIKit

final class Place {
    
    var name: String
    var location: String
    var rating: Int
    var distance: Float
    var avatar: UIImage
    var isFavorite: Bool
    
    init(name: String, location: String, rating: Int, distance: Float, avatar: UIImage) {
        self.name = name
        self.location = location
        self.rating = rating
        self.distance = distance
        self.avatar = avatar
        self.isFavorite = true
    }
}

extension Place {
    static func dummyData() -> [Place] {
        let newDiaDiem: [Place] = {
            let diaDiem1 = Place(name: "The Coffe House", location: "1 le duan", rating: 8, distance: 2, avatar: UIImage(named: "ic-car1")!)
            let diaDiem2 = Place(name: "Mr.Beer", location: "2 le duan", rating: 8, distance: 3, avatar: UIImage(named: "ic-car2")!)
            let diaDiem3 = Place(name: "Thanh Mai", location: "3 le duan", rating: 8, distance: 4, avatar: UIImage(named: "ic-car3")!)
            let diaDiem4 = Place(name: "shop4", location: "4 le duan", rating: 8, distance: 5, avatar: UIImage(named: "ic-car4")!)
            let diaDiem5 = Place(name: "shop5", location: "5 le duan", rating: 8, distance: 6, avatar: UIImage(named: "ic-car5")!)
            let diaDiem6 = Place(name: "shop6", location: "6 le duan", rating: 8, distance: 7, avatar: UIImage(named: "ic-car6")!)
            let diaDiem7 = Place(name: "shop7", location: "7 le duan", rating: 8, distance: 8, avatar: UIImage(named: "ic-car7")!)
            let diaDiem8 = Place(name: "shop8", location: "8 le duan", rating: 8, distance: 9, avatar: UIImage(named: "ic-car1")!)
            return [diaDiem1,diaDiem2,diaDiem3,diaDiem4,diaDiem5,diaDiem6,diaDiem7,diaDiem8]
        }()
        return newDiaDiem
    }
}
