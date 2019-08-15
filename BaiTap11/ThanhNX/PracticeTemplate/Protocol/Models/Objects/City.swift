//
//  City.swift
//  Protocol
//
//  Created by PCI0008 on 8/15/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import Foundation

final class City {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

extension City {
    struct Dummy {
        static let citys: [City] = [City(name: "Ha Noi"),
        City(name: "Hai Phong"),
        City(name: "Hung Yen"),
        City(name: "Lang Son"),
        City(name: "Cao Bang"),
        City(name: "Bac Ninh"),
        City(name: "Yen Bai"),
        City(name: "Phu Tho"),
        City(name: "Lao Cai"),
        City(name: "Ninh Binh"),
        City(name: "Sai Gon"),
        City(name: "Dong Nai"),
        City(name: "Can Tho"),
        City(name: "Vung Tau"),
        City(name: "Ca Mau"),
        City(name: "Thai Nguyen"),
        City(name: "An Giang"),
        City(name: "Da Nang"),
        City(name: "Quang Nam"),
        City(name: "Quang Ngai"),
        City(name: "Binh Dinh"),
        City(name: "Phu Yen"),
        City(name: "Khanh Hoa"),
        City(name: "Lam Dong"),
        City(name: "Thua Thien Hue"),
        City(name: "Quang Tri"),
        City(name: "Quang Binh"),
        City(name: "Ha Tinh"),
        City(name: "Nghe An"),
        City(name: "Thanh Hoa"),
        City(name: "Kon Tum"),
        City(name: "Gia Lai"),
        City(name: "Tien Giang"),
        City(name: "Hau Giang")]
    }
}
