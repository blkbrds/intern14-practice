//
//  AppConstants.swift
//  DatingMessenger
//
//  Created by MBA0051 on 10/21/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import Foundation

struct AppConstants {
    
    // Call to API.
    static let protocolo    : String = "http://"
    static let apiVersion   : String = "/api"
    static let domain       : String = "localhost:8080"
    static let baseUrl      : String = AppConstants.protocolo + AppConstants.domain
    
    static let schedule     : String = "/schedule"

    var defaultHTTPHeaders: [String: String] {
        var headers: [String: String] = [:]
        headers["Content-Type"] = "application/json"
        return headers
    }
}
