//
//  MonthWithValues.swift
//  Custom View
//
//  Created by PCI0007 on 8/1/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

class MonthWithValue {
    var months: String
    var unitSold: CGFloat
    init(_ months: String, _ unitSold: CGFloat) {
        self.months = months
        self.unitSold = unitSold
    }
}
