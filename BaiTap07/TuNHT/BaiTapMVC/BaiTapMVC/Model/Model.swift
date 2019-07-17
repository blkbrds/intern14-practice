//
//  Model.swift
//  BaiTapMVC
//
//  Created by PCI0001 on 7/8/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class Model: UIViewController {
    static var arrStack : [Double] = []
    
    func isEmpty() -> Bool {
        return Model.arrStack.isEmpty
    }
    
    func push(_ element: Double) {
        return Model.arrStack.append(element)
    }
    
    func pop() -> Double? {
        return Model.arrStack.popLast()
    }
}
