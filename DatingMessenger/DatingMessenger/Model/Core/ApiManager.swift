//
//  ApiManager.swift
//  DatingMessenger
//
//  Created by MBA0051 on 10/25/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import Foundation
import Alamofire

typealias JSObject = [String: Any]
typealias JSArray = [JSObject]

typealias Completion = (Result<Any>) -> Void

let api = ApiManager()

final class ApiManager {

    var defaultHTTPHeaders: [String: String] {
        let headers: [String: String] = [:]
        return headers
    }
}
