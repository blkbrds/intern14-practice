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
    
    func getSchedules(completion: @escaping (APIError?) -> Void) {
        APIServices.Schedule.getSchedules { (result) in
            switch result {
            case .failure(let error):
                completion(error)
            case .success(let scheduleResult):
                for schedule in scheduleResult.schedules {
                    self.schedules.append(schedule)
                }
                completion(nil)
            }
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
