//
//  MessageViewModel.swift
//  DatingMessenger
//
//  Created by MBA0051 on 10/22/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import Foundation

class MessageViewModel {

    var messageData: [Messages] = []
    
    init() { }
    
    /**
     * Get message list.
     */
    func getMessages(completion: () -> Void) {
        MessagesManager.getMessages { (datas) in
            self.messageData = datas
            completion()
        }
    }
    
    func numberOfSections() -> Int {
        return 1
    }
}
