//
//  ColorButton.swift
//  Touch-Event
//
//  Created by MBA0217 on 8/27/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

struct ColorButton {
    var color: UIColor
    var brushWidth: CGFloat
    
    init(color: UIColor, brushWidth: CGFloat) {
        self.brushWidth = brushWidth
        self.color = color
    }
}

extension Array {
    func getListColorButton () -> [ColorButton] {
        let colorButtons: [ColorButton] = [
            ColorButton(color: UIColor.blue, brushWidth: 10.0),
            ColorButton(color: UIColor.green, brushWidth: 10.0),
            ColorButton(color: UIColor.red, brushWidth: 10.0),
            ColorButton(color: UIColor.yellow, brushWidth: 10.0),
            ColorButton(color: UIColor.purple, brushWidth: 10.0),
            ColorButton(color: UIColor.orange, brushWidth: 10.0),
        ]
        
        return colorButtons
    }
}
