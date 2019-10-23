//
//  ScheduleDetailModelView.swift
//  DatingMessenger
//
//  Created by MBA0051 on 10/23/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import Foundation

class ScheduleDetailViewModel {
    
    var scheduleTitle: String?
    var scheduleDate: Date?
    var timeSchedule: String?
    var contentSchedule: String?
    var status: AcceptStatus
    
    init(schedule: ScheduleObject) {
        
        self.scheduleTitle = schedule.scheduleTitle
        self.scheduleDate = schedule.scheduleDate
        self.timeSchedule = schedule.scheduleTime
        self.contentSchedule = schedule.scheduleContent
        self.status = schedule.acceptStatus
    }
}
