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

final class ScheduleObject {
    var id: String?
    var scheduleStartDate: String?
    var scheduleStartTime: String?
    var scheduleEndDate: String?
    var scheduleEndTime: String?
    var scheduleTitle: String?
    var scheduleContent: String?
    var acceptStatus: AcceptStatus = .New
    
    init() { }
    
    init(id: String, startDate: String, startTime: String, endDate: String, endTime: String, scheduleTitle: String, scheduleContent: String, acceptStatus: AcceptStatus) {
        self.id = id
        self.scheduleStartDate = startDate
        self.scheduleStartTime = startTime
        self.scheduleEndDate = endDate
        self.scheduleEndTime = endTime
        self.scheduleTitle = scheduleTitle
        self.scheduleContent = scheduleContent
        self.acceptStatus = acceptStatus
    }
    
    init(json: [String: Any]) {
        
        if let data = json["data"] as? [String: Any] {
            if let id = data["id"] as? String {
                        self.id = id
                    }
                    if let title = data["title"] as? String {
                        self.scheduleTitle = title
                    }
                    // Start time.
                         if let beginTime = Helper.shared.convertStringToComponents(from: timeStart) {
                            self.scheduleStartDate = String(beginTime.day!) + "/" + String(beginTime.month!)
                            self.scheduleStartTime = String(beginTime.hour!) + ":" + String(beginTime.minute!)
                        }
                    }
                    // End time.
                    if let timeEnd = data["time_end"] as? String {
                        if let endTime = Helper.shared.convertStringToComponents(from: timeEnd) {
                            self.scheduleEndDate = String(endTime.day!) + "/" + String(endTime.month!)
                            self.scheduleEndTime = String(endTime.hour!) + ":" + String(endTime.minute!)
                        }
                    }
                    if let content = data["content"] as? String {
                        self.scheduleContent = content
                    }
            //        if let status = json["status"] as? String {
                        self.acceptStatus = AcceptStatus.New
            //        }
        }
        
        
    }
    
    // TODO: Not yet implements json convert.
}
