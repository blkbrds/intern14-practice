//
//  PaintColor.swift
//  ExTouchEvent
//
//  Created by PCI0010 on 8/16/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import Foundation
import UIKit

enum Colors {
    case black
    case brown
    case green
    case magenta
    case orange
    case purple
    
    init?(tag: Int) {
        switch tag {
        case 1:
            self = .black
        case 2:
            self = .brown
        case 3:
            self = .green
        case 4:
            self = .magenta
        case 5:
            self = .orange
        case 6:
            self = .purple
        default:
            return nil
        }
    }
    
    var color: UIColor {
        switch self {
        case .black:
            return .black
        case .brown:
            return .brown
        case .green:
            return .green
        case .magenta:
            return .magenta
        case .orange:
            return .orange
        case .purple:
            return .purple
        }
    }
}
