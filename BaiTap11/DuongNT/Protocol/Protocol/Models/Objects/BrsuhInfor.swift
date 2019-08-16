//
//  BrsuhInfor.swift
//  Protocol
//
//  Created by Nguyen Duong on 8/16/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import Foundation

struct BrushInfor {

    var red: Float
    var blue: Float
    var green: Float
    var brushSize: Float

    init(red: Float, green: Float, blue: Float, brushSize: Float) {
        self.red = red
        self.green = green
        self.blue = blue
        self.brushSize = brushSize
    }
}
