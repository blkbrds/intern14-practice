//
//  APIRequest.swift
//  ExTabbar
//
//  Created by PCI0010 on 9/16/19.
//  Copyright © 2019 PCI0010. All rights reserved.
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
                    } else {
                        completion(.failure(.errorDataFormat))
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
                    } else {
                        completion(.failure(.errorDataFormat))
                    }
                }
            }
        }
        dataTask.resume()
    }
}
