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
    var startDate: String?
    var startTime: String?
    var endDate: String?
    var endTime: String?
    var contentSchedule: String?
    var status: AcceptStatus
    
    init(schedule: ScheduleObject) {
        
        self.scheduleTitle = schedule.scheduleTitle
        self.startDate = schedule.scheduleStartDate
        self.startTime = schedule.scheduleStartTime
        self.endDate = schedule.scheduleEndDate
        self.endTime = schedule.scheduleEndTime
        self.contentSchedule = schedule.scheduleContent
        self.status = schedule.acceptStatus
    }
}
