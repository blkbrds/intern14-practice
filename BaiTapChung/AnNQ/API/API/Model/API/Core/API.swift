//
//  API.swift
//  API
//
//  Created by MBA0217 on 10/22/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import Foundation

// Defines
enum APIError: Error {
    case error(String)
    case errorURL
    
    var localizedDescription: String {
        switch self {
        case .error(let string):
            return string
        case .errorURL:
            return "URL is not exists."
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
    static var shared: API = {
        let shareAPI = API()
        return shareAPI
    }()
  
    //init
    private init() {}
}
