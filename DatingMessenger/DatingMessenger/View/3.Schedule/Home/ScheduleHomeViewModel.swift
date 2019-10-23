//
//  ScheduleHomeViewModel.swift
//  DatingMessenger
//
//  Created by MBA0051 on 10/22/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import Foundation

class ScheduleHomeViewModel {
    
    var schedules: [ScheduleObject] = []
    init() {}
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func getSchedules(completion: () -> Void) {
        ScheduleManager.getSchedules { (schedules) in
            self.schedules = schedules
            completion()
        }
    }
    
    func cellViewModel(at indexPath: IndexPath) -> ScheduleCellViewModel {
        return ScheduleCellViewModel(schedule: schedules[indexPath.row])
    }
    
    func numberOfRowsInSection() -> Int {
        return schedules.count
    }
    
    func detailViewModel(at indexPath: IndexPath) -> ScheduleDetailViewModel {
        return ScheduleDetailViewModel(schedule: schedules[indexPath.row])
    }
}
