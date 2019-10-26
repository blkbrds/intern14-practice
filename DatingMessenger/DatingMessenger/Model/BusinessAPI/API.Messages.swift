//
//  MessagesManager.swift
//  DatingMessenger
//
//  Created by MBA0051 on 10/22/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import Foundation

extension APIServices.Message {
    
    struct QueryString {
    }
    
    struct MessageResult {
        var messages : [MessageObject]
    }

    /**
     * Get all schedules.
     */
    static func getMessages(completion: @escaping APICompletion<MessageResult>) {
        
//        var friends: [MessageObject] = []
//
//        let mark = Friends()
//        mark.username = "Mark zukeberg"
//        mark.profileImage = "avatar.png"
//        let markMessage = MessageObject()
//        markMessage.messageText = "Hello, welcome to Dating chat program."
//        markMessage.messageLastTime = NSDate()
//        markMessage.friend = mark
//        friends.append(markMessage)
//
//        let trumb = Friends()
//        trumb.username = "Donal Trumb"
//        trumb.profileImage = "avatar.png"
//        let trumbMessage = MessageObject()
//        trumbMessage.messageText = "Hello, i'm Donal Trumb."
//        trumbMessage.messageLastTime = NSDate()
//        trumbMessage.friend = mark
//        friends.append(trumbMessage)
//
//        completion(MessageResult(messages: [friends]))
    }
}
