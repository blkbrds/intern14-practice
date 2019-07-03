//
//  ColorButton.swift
//  TouchEvents
//
//  Created by Nguyen Duong on 7/2/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import Foundation
import UIKit

enum ColorButton {
    case green
    case red
    case blue
    case yellow
    case purple
    case orange
    case white
    
    init?(tag: Int) {
        switch tag {
        case 1:
            self = .green
        case 2:
            self = .red
        case 3:
            self = .blue
        case 4:
            self = .yellow
        case 5:
            self = .purple
        case 6:
            self = .orange
        case 7:
            self = .white
        default:
            return nil
        }
    }
    
    var color: UIColor {
        switch self {
        case .green:
            return .green
        case .red:
            return .red
        case .blue:
            return .blue
        case .yellow:
            return .yellow
        case .purple:
            return .purple
        case .orange:
            return .orange
        case .white:
            return .white
        }
    }
}
