//
//  File.swift
//  KiemTraLan2-AnhLT
//
//  Created by PCI0013 on 8/5/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import Foundation
class Dongvat {
    var name: String
    var weight: Int
    var legNumb: Int
    init(_ name: String,_ weight: Int,_ legNumb: Int) {
        self.name = name
        self.weight = weight
        self.legNumb = legNumb
    }
}

class Ga: Dongvat {
    override init(_ name: String,_ weight: Int,_ legNumb: Int = 2) {
        super.init(name, weight, legNumb)
    }
}

class De: Dongvat {
    override init(_ name: String,_ weight: Int,_ legNumb: Int = 4) {
        super.init(name, weight, legNumb)
    }
}

//class Chuong {
//    var soDe: Int
//    var soGa: Int
//    var tongSoChan: Int
//    var biBenh: Bool
//    init(_ soDe: Int, soGa: Int, tongSoChan: Int) {
//        self.soDe = soDe
//        self.soGa = soGa
//        self.tongSoChan = tongSoChan
//    }
//    func tieuHuy(soGiaCam: Int, soGiaSuc: Int, soDongVatBenh: Int ) {
//        if biBenh == true {
//            
//        }
//    }
//}
