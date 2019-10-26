//
//  ScheduleManager.swift
//  DatingMessenger
//
//  Created by MBA0051 on 10/22/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import Foundation

extension APIServices.Schedule {
    
    struct QueryString {
        
        func getScheduleById(limit: Int) -> String {
            return Commons.baseUrl + Commons.schedule + "/" + String(limit)
        }
        
        func getUserSchedules() -> String {
            return Commons.baseUrl + Commons.schedule
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
    static func getSchedules(completion: @escaping APICompletion<ScheduleResult>) {
        
        // Querry call to URL.
        let urlString = QueryString().getUserSchedules()
        
//        API.shared().request(urlString: urlString, method: "POST", param: ["test": "test"], scheduleToSave: ScheduleObject()) { (result) in
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
    }

    static func getSchedulesById(limit: Int = 5, completion: @escaping APICompletion<ScheduleResult>) {
        // Querry call to URL.
        let urlString = QueryString().getScheduleById(limit: 5)
        
        API.shared().request(urlString: urlString) { (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            case .success(let data):
                if let data = data {
                    let json = data.convertToJSON()
                    let schedule = ScheduleObject(json: json)
                    var schedules = [ScheduleObject]()
                    schedules.append(schedule)
                    completion(.success(ScheduleResult(schedules: schedules)))
                } else {
                    completion(.failure(.error("Data is not format.")))
                }
            }
        }
    }
}
