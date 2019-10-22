//
//  MessageCellViewModel.swift
//  DatingMessenger
//
//  Created by MBA0051 on 10/22/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import Foundation

class MessageCellViewModel {
    
    var messageText: String?
    var messageLastTime: NSDate?
    var username: String?
    var profileImage: String?
    
    init(message: Messages) {
        self.messageText = message.messageText
        self.messageLastTime = message.messageLastTime
        self.username = message.friend?.username
        self.profileImage = message.friend?.profileImage
    }
}
