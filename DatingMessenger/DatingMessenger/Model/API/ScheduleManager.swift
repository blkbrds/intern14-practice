//
//  ScheduleManager.swift
//  DatingMessenger
//
//  Created by MBA0051 on 10/22/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import Foundation

extension APIServiceManager.Schedule {
    
    struct QueryString {
        
        func getScheduleById(limit: Int) -> String {
            return AppConstants.baseUrl + AppConstants.schedule + "/" + String(limit)
        }
        
        func getUserSchedules() -> String {
            return AppConstants.baseUrl + AppConstants.schedule
        }
    }
    
    struct ScheduleResult {
        var schedules : [ScheduleObject]
    }

    /**
     * Convert response data to JSON.
     */
    private func convertToJSON(from data: Data) -> [String: Any] {
        var json: [String: Any] = [:]
        do {
            if let jsonObj = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                json = jsonObj
            }
        } catch {
            print("JSON casting error")
        }
        return json
    }
    
    /**
     * Get all schedules.
     */
    static func getSchedules(limit: Int = 5, completion: @escaping APICompletion<ScheduleResult>) {
        
        // Save schedule.
        let postRequest = APIRequest(endpoint: "schedule")
        postRequest.save(ScheduleObject(), completion: { result in
            switch result {
            case .success(let schedule):
                print("Send schedule successful.")
            case .failure(let error):
                print("Error content: \(error)")
            }
        })
        
        // Querry call to URL.
//        let urlString = QueryString().getUserSchedules()
        
//        API.shared().request(urlString: urlString) { (result) in
//            switch result {
//            case .failure(let error):
//                print(error.localizedDescription)
//                completion(.failure(error))
//            case .success(let data):
//                if let data = data {
//                    let json = data.convertToJSON()
//                    let schedule = ScheduleObject(json: json)
//                    var schedules = [ScheduleObject]()
//                    schedules.append(schedule)
//                    completion(.success(ScheduleResult(schedules: schedules)))
//                } else {
//                    completion(.failure(.error("Data is not format.")))
//                }
//            }
//        }

        var schedules = [ScheduleObject]()
        let schedule = ScheduleObject(id: "1", startDate: "20/10", startTime: "18:30", endDate: "20/10", endTime: "20:00", scheduleTitle: "Mitting", scheduleContent: "Chao mung ngay phu nu viet nam", acceptStatus: .New)
        schedules.append(schedule)
        completion(.success(ScheduleResult(schedules: schedules)))
        // Dummy data - reason not connect.
    }

    static func getSchedulesById(limit: Int = 5, completion: @escaping APICompletion<ScheduleResult>) {
            // Querry call to URL.
//            let urlString = QueryString().getScheduleById(limit: limit)
            
    //        API.shared().request(urlString: urlString) { (result) in
    //            switch result {
    //            case .failure(let error):
    //                print(error.localizedDescription)
    //                completion(.failure(error))
    //            case .success(let data):
    //                if let data = data {
    //                    let json = data.convertToJSON()
    //                    let schedule = ScheduleObject(json: json)
    //                    var schedules = [ScheduleObject]()
    //                    schedules.append(schedule)
    //                    completion(.success(ScheduleResult(schedules: schedules)))
    //                } else {
    //                    completion(.failure(.error("Data is not format.")))
    //                }
    //            }
    //        }

            var schedules = [ScheduleObject]()
            let schedule = ScheduleObject(id: "1", startDate: "20/10", startTime: "18:30", endDate: "20/10", endTime: "20:00", scheduleTitle: "Mitting", scheduleContent: "Chao mung ngay phu nu viet nam", acceptStatus: .New)
            schedules.append(schedule)
            completion(.success(ScheduleResult(schedules: schedules)))
            // Dummy data - reason not connect.
        }
}
