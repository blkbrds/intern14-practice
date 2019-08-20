//
//  ButtonAlert.swift
//  ContactList
//
//  Created by Nguyen Duong on 8/19/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import Foundation

enum Style {
    case cancel
    case defauls
}
struct AlertButton {
    var name: String
    var style: Style
    var handle: Void?
    
    init(name: String, style: Style, handle: Void?) {
        self.name = name
        self.style = style
        self.handle = handle ?? nil
    }
}
