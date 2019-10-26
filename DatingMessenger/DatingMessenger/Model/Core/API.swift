//
//  API.swift
//  DatingMessenger
//
//  Created by MBA0051 on 10/24/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import Foundation

final class Api {
    struct Path {
        #if DEBUG
            static let baseURL = "https://dev-asiantech.vn"
        #elseif STG
            static let baseURL = "https://stg-asiantech.vn"
        #else
            static let baseURL = "https://pro-asiantech.vn"
        #endif
    }
}

protocol URLStringConvertible {
    var urlString: String { get }
}

protocol ApiPath: URLStringConvertible {
    static var path: String { get }
}

extension URL: URLStringConvertible {
    var urlString: String { return absoluteString }
}

extension Int: URLStringConvertible {
    var urlString: String { return String(describing: self) }
}

private func / (lhs: URLStringConvertible, rhs: URLStringConvertible) -> String {
    return lhs.urlString + "/" + rhs.urlString
}

extension String: URLStringConvertible {
    var urlString: String { return self }
}

extension CustomStringConvertible where Self: URLStringConvertible {
    var urlString: String { return description }
}


// Defines
//enum APIError: Error {
//    case error(String)
//    case errorURL
//    case responseProblem
//    case decodingProblem
//    case otherProblem
//
//    var localizedDescription: String {
//        switch self {
//        case .error(let string):
//            return string
//        case .errorURL:
//            return "URL String is error."
//        case .responseProblem:
//            return "response error"
//        case .decodingProblem:
//            return "decoding error"
//        case .otherProblem:
//            return "other error"
//        }
//    }
//}
//
//typealias APICompletion<T> = (Result<T, APIError>) -> Void
//
//enum APIResult {
//    case success(Data?)
//    case failure(APIError)
//}
//
//struct API {
//    //singleton
//    private static var shareAPI: API = {
//        let shareAPI = API()
//        return shareAPI
//    }()
//
//    static func shared() -> API {
//        return shareAPI
//    }
//
//    //init
//    private init() {}
//}
//
//enum RequestType: String {
//    case POST
//    case GET
//    case PUT
//    case DELETE
//}
//
//extension API {
//    func request(urlString: String, completion: @escaping (APIResult) -> Void) {
//        guard let url = URL(string: urlString) else {
//            completion(.failure(.errorURL))
//            return
//        }
//
//        let config = URLSessionConfiguration.ephemeral
//        config.waitsForConnectivity = true
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: url) { (data, _, error) in
//            DispatchQueue.main.async {
//                if let error = error {
//                    completion(.failure(.error(error.localizedDescription)))
//                } else {
//                    if let data = data {
//                        completion(.success(data))
//                    }
//                }
//            }
//        }
//        dataTask.resume()
//    }
//
//    func request(url: URL, completion: @escaping (APIResult) -> Void) {
//        let config = URLSessionConfiguration.ephemeral
//        config.waitsForConnectivity = true
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: url) { (data, _, error) in
//            DispatchQueue.main.async {
//                if let error = error {
//                    completion(.failure(.error(error.localizedDescription)))
//                } else {
//                    if let data = data {
//                        completion(.success(data))
//                    }
//                }
//            }
//        }
//        dataTask.resume()
//    }
//
//    func getRequest(urlString: String, method: String, withParam: [String: Any], completion: @escaping (APIResult) -> Void) {
//        guard let url = URL(string: urlString) else {
//            completion(.failure(.errorURL))
//            return
//        }
//
//        let config = URLSessionConfiguration.ephemeral
//        config.waitsForConnectivity = true
//        let session = URLSession.shared
//
////        // Write
////        var urlRequest = URLRequest(url: url)
////        let parameter = ["schedule_title": "value", "schedule_time": "value 2"]
////        urlRequest.httpMethod = "POST"
////        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
////        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameter, options: []) else { return }
////        urlRequest.httpBody = httpBody
//
////        urlRequest.httpBody = try JSONEncoder().encode(scheduleToSave)
//
//        // prepare json data
////        let json: [String: Any] = ["schedule_title": "ABC",
////                                   "schedule_time": "schedule_time"]
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        let jsonData = try? JSONSerialization.data(withJSONObject: withParam)
//
//        // insert json data to the request
//        request.httpBody = jsonData
//
//        let dataTask = session.dataTask(with: request) { (data, _, error) in
//            DispatchQueue.main.async {
//                if let error = error {
//                    completion(.failure(.error(error.localizedDescription)))
//                } else {
//                    if let data = data {
//                        completion(.success(data))
//                    }
//                }
//            }
//        }
//        dataTask.resume()
//    }
//
//
//    func postRequest(urlString: String, method: String, withBody: [String: Any], completion: @escaping (APIResult) -> Void) {
//            guard let url = URL(string: urlString) else {
//                completion(.failure(.errorURL))
//                return
//            }
//
//            let config = URLSessionConfiguration.ephemeral
//            config.waitsForConnectivity = true
//            let session = URLSession.shared
//
//            // prepare json data
//    //        let json: [String: Any] = ["schedule_title": "ABC",
//    //                                   "schedule_time": "schedule_time"]
//
//            var request = URLRequest(url: url)
//            request.httpMethod = "POST"
//            let jsonData = try? JSONSerialization.data(withJSONObject: withBody)
//
//            // insert json data to the request
//            request.httpBody = jsonData
//
//            let dataTask = session.dataTask(with: request) { (data, _, error) in
//                DispatchQueue.main.async {
//                    if let error = error {
//                        completion(.failure(.error(error.localizedDescription)))
//                    } else {
//                        if let data = data {
//                            completion(.success(data))
//                        }
//                    }
//                }
//            }
//            dataTask.resume()
//        }
//}
