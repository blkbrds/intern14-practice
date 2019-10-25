//
//  API.swift
//  DatingMessenger
//
//  Created by MBA0051 on 10/24/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import Foundation

// Defines
enum APIError: Error {
    case error(String)
    case errorURL
    case responseProblem
    case decodingProblem
    case otherProblem
    
    var localizedDescription: String {
        switch self {
        case .error(let string):
            return string
        case .errorURL:
            return "URL String is error."
        case .responseProblem:
            return "response error"
        case .decodingProblem:
            return "decoding error"
        case .otherProblem:
            return "other error"
        }
    }
}
    
typealias APICompletion<T> = (Result<T, APIError>) -> Void
    
enum APIResult {
    case success(Data?)
    case failure(APIError)
}

struct API {
    //singleton
    private static var shareAPI: API = {
        let shareAPI = API()
        return shareAPI
    }()
    
    static func shared() -> API {
        return shareAPI
    }
    
    //init
    private init() {}
}

enum RequestType: String {
    case POST
    case GET
    case PUT
    case DELETE
}
