//
//  ScheduleManager.swift
//  DatingMessenger
//
//  Created by MBA0051 on 10/22/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import Foundation

class ScheduleManager {
    class func getSchedules(completion: ([ScheduleObject]) -> Void) {
        var schedules: [ScheduleObject] = []
        completion(schedules)
    }
}
