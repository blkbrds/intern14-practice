//
//  APIManager.swift
//  DatingMessenger
//
//  Created by MBA0051 on 10/24/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import Foundation
import UIKit

protocol  APIManagerDelegate: class {
    func request(data: [String: Any], error: Error?)
    func downloadImage(image: UIImage?, error: Error?)
}

class APIManager {

    weak var delegate: APIManagerDelegate?

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

    func request(with urlString: String, completion: @escaping () -> Void) {
        guard let url = URL(string: urlString) else { return }
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                self.delegate?.request(data: [:], error: error)
            } else {
                if let data = data {
                    let json = self.convertToJSON(from: data)
                    self.delegate?.request(data: json, error: nil)
                } else {
                    self.delegate?.request(data: [:], error: nil)
                }
            }
            completion()
        }
        task.resume()
    }

    func downloadImage(url: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: url) else { return }
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: url) { (data, response, error) in
            var image: UIImage?
            if let error = error {
                self.delegate?.request(data: [:], error: error)
            } else {
                if let data = data {
                    image = UIImage(data: data)
                    self.delegate?.downloadImage(image: image, error: nil)
                } else {
                    self.delegate?.downloadImage(image: nil, error: nil)
                }
            }
            completion(image)
        }
        task.resume()
    }
    
    func postRequest() {
        
    }
}
