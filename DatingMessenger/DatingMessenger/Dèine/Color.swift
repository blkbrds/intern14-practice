//
//  Color.swift
//  DatingMessenger
//
//  Created by MBA0051 on 10/25/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

extension App {
    struct Color {
        static let navigationBar = UIColor.black
        static let tableHeaderView = UIColor.gray
        static let tableFooterView = UIColor.red
        static let tableCellTextLabel = UIColor.yellow

        static func button(state: UIControlState) -> UIColor {
            switch state {
            case UIControlState.normal: return .blue
            default: return .gray
            }
        }
    }
}
