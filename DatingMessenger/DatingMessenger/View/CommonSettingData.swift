//
//  CommonSettingData.swift
//  DatingMessenger
//
//  Created by MBA0051 on 10/19/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class CommonSettingData {
    static let shared = CommonSettingData()
    
    private init() {}
    
    func createDummyMessages() -> [Messages] {
        var friends: [Messages] = []
        
        let mark = Friends()
        mark.username = "Mark zukeberg"
        mark.profileImage = "avatar.png"
        let markMessage = Messages()
        markMessage.messageText = "Hello, welcome to Dating chat program."
        markMessage.messageLastTime = NSDate()
        markMessage.friend = mark
        friends.append(markMessage)
        
        let trumb = Friends()
        trumb.username = "Donal Trumb"
        trumb.profileImage = "avatar.png"
        let trumbMessage = Messages()
        trumbMessage.messageText = "Hello, i'm Donal Trumb."
        trumbMessage.messageLastTime = NSDate()
        trumbMessage.friend = mark
        friends.append(trumbMessage)
        
        return friends
    }
}
