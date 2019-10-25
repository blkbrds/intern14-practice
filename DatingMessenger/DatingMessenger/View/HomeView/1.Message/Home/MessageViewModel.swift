//
//  MessageViewModel.swift
//  DatingMessenger
//
//  Created by MBA0051 on 10/22/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import Foundation

class MessageViewModel {

    var messages: [Messages] = []
    
    init() { }
    
    /**
     * Get message list.
     */
    func getMessages(completion: () -> Void) {
        MessagesManager.getMessages { (datas) in
            self.messages = datas
            completion()
        }
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfItemsInSection() -> Int {
        return messages.count
    }
}
