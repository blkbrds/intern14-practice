//
//  ScheduleObject.swift
//  DatingMessenger
//
//  Created by MBA0051 on 10/22/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import Foundation

enum AcceptStatus: String {
    case Accept
    case Reject
    case New
    case Expired
}

struct ScheduleObject {
    let id: Int
    let scheduleDate: Date
    let scheduleTime: String
    let scheduleTitle: String
    let scheduleContent: String
    let acceptStatus: AcceptStatus
    
    init(id: Int, scheduleDate: Date, scheduleTime: String, scheduleTitle: String, scheduleContent: String, acceptStatus: AcceptStatus) {
        self.id = id
        self.scheduleDate = scheduleDate
        self.scheduleTime = scheduleTime
        self.scheduleTitle = scheduleTitle
        self.scheduleContent = scheduleContent
        self.acceptStatus = acceptStatus
    }
    
    // TODO: Not yet implements json convert.
}
