//
//  APIRequest.swift
//  DatingMessenger
//
//  Created by MBA0051 on 10/24/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import Foundation

/**
 * Type of error can happen.
 */
enum APIError: Error {
    case responseProblem
    case decodingProblem
    case otherProblem
}


struct APIRequest {
    let resourceURL: URL
    
    init(endpoint: String) {
        let resourceString = AppConstants.baseUrl + endpoint
        
        guard let resourceURL = URL(string: resourceString) else { return faltaError() }
        self.resourceURL = resourceURL
    }
    
    func save(scheduleToSave: ScheduleObject, completion: @escaping (Result<ScheduleObject, APIError>) -> Void) {
        do {
            let parameter = ["test": "value", "test2": "value 2"]
            var urlRequest = URLRequest(url: resourceURL)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
//            guard let urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: parameter, options: []) else { return }
            urlRequest.httpBody = try JSONEncoder().encode(scheduleToSave)
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, _ in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let jsonData = data else {
                    completion(.failure(.responseProblem))
                    return
                }
                do {
                    let messageData = try JSONDecoder().decode(ScheduleObject.self, from: jsonData)
                    completion(.success(messageData))
                } catch {
                    completion(.failure(.decodingProblem))
                }
            }
            
            dataTask.resume()
        } catch {
            completion(.failure(.otherProblem))
        }
    }
}
