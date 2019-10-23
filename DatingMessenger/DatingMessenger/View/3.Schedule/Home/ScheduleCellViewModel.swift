//
//  ScheduleCellModel.swift
//  DatingMessenger
//
//  Created by MBA0051 on 10/22/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import Foundation

class ScheduleCellViewModel {
    var timeSchedule: String?
    var contentSchedule: String?
    var status: AcceptStatus
    
    init(schedule: ScheduleObject) {
        self.timeSchedule = schedule.scheduleTime
        self.contentSchedule = schedule.scheduleContent
        self.status = schedule.acceptStatus
    }
}
