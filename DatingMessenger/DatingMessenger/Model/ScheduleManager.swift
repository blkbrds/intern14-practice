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
        
        let gregorianCalendar = NSCalendar(calendarIdentifier: .gregorian)!
        let dateComponents = NSDateComponents()
        dateComponents.day = 10
        dateComponents.month = 10
        dateComponents.year = 2019
        let date = gregorianCalendar.date(from: dateComponents as DateComponents)!
        
        schedules.append(ScheduleObject(id: 1, scheduleDate: date, scheduleTime: "11:11:00", scheduleTitle: "Mung 1009 nam Thang Long Ha Noi", scheduleContent: "Ky niem 1009 nam Thang Long Ha Noi va chien thang thu do.", acceptStatus: AcceptStatus.New))
        schedules.append(ScheduleObject(id: 2, scheduleDate: date, scheduleTime: "14:00:00", scheduleTitle: "Meeting chao mung 1009 nam Thang Long Ha Noi", scheduleContent: "Meeting ky niem 1009 nam Thang Long Ha Noi va chien thang thu do.", acceptStatus: AcceptStatus.New))
        schedules.append(ScheduleObject(id: 3, scheduleDate: date, scheduleTime: "18:00:00", scheduleTitle: "Da Bong", scheduleContent: "da bong va an choi", acceptStatus: AcceptStatus.New))
        completion(schedules)
    }
}
