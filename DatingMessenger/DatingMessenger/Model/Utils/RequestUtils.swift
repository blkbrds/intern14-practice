//
//  APIRequest.swift
//  DatingMessenger
//
//  Created by MBA0051 on 10/24/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import Foundation

extension API {
    func request(urlString: String, completion: @escaping (APIResult) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.errorURL))
            return
        }
        
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { (data, _, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(.error(error.localizedDescription)))
                } else {
                    if let data = data {
                        completion(.success(data))
                    }
                }
            }
        }
        dataTask.resume()
    }
    
    func request(url: URL, completion: @escaping (APIResult) -> Void) {
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { (data, _, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(.error(error.localizedDescription)))
                } else {
                    if let data = data {
                        completion(.success(data))
                    }
                }
            }
        }
        dataTask.resume()
    }
    
    func getRequest(urlString: String, method: String, withParam: [String: Any], completion: @escaping (APIResult) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.errorURL))
            return
        }
        
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true
        let session = URLSession.shared
        
//        // Write
//        var urlRequest = URLRequest(url: url)
//        let parameter = ["schedule_title": "value", "schedule_time": "value 2"]
//        urlRequest.httpMethod = "POST"
//        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameter, options: []) else { return }
//        urlRequest.httpBody = httpBody

//        urlRequest.httpBody = try JSONEncoder().encode(scheduleToSave)
        
        // prepare json data
//        let json: [String: Any] = ["schedule_title": "ABC",
//                                   "schedule_time": "schedule_time"]

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let jsonData = try? JSONSerialization.data(withJSONObject: withParam)

        // insert json data to the request
        request.httpBody = jsonData
        
        let dataTask = session.dataTask(with: request) { (data, _, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(.error(error.localizedDescription)))
                } else {
                    if let data = data {
                        completion(.success(data))
                    }
                }
            }
        }
        dataTask.resume()
    }
    
    
    func postRequest(urlString: String, method: String, withBody: [String: Any], completion: @escaping (APIResult) -> Void) {
            guard let url = URL(string: urlString) else {
                completion(.failure(.errorURL))
                return
            }
            
            let config = URLSessionConfiguration.ephemeral
            config.waitsForConnectivity = true
            let session = URLSession.shared

            // prepare json data
    //        let json: [String: Any] = ["schedule_title": "ABC",
    //                                   "schedule_time": "schedule_time"]

            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            let jsonData = try? JSONSerialization.data(withJSONObject: withBody)

            // insert json data to the request
            request.httpBody = jsonData
            
            let dataTask = session.dataTask(with: request) { (data, _, error) in
                DispatchQueue.main.async {
                    if let error = error {
                        completion(.failure(.error(error.localizedDescription)))
                    } else {
                        if let data = data {
                            completion(.success(data))
                        }
                    }
                }
            }
            dataTask.resume()
        }
}
