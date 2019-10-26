//
//  RequestSerializer.swift
//  DatingMessenger
//
//  Created by MBA0051 on 10/25/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import Alamofire
import Foundation

extension ApiManager {
    @discardableResult
    func request(method: HTTPMethod,
                 urlString: URLStringConvertible,
                 parameters: [String: Any]? = nil,
                 headers: [String: String]? = nil,
                 completion: Completion?) -> Request? {
        guard Network.shared.isReachable else {
            completion?(.failure(Api.Error.network))
            return nil
        }

        let encoding: ParameterEncoding
        if method == .post {
            encoding = JSONEncoding.default
        } else {
            encoding = URLEncoding.default
        }

        var _headers = api.defaultHTTPHeaders
        _headers.updateValues(headers)

        let request = Alamofire.request(urlString.urlString,
                                        method: method,
                                        parameters: parameters,
                                        encoding: encoding,
                                        headers: _headers
        ).responseJSON(completion: { (response) in
            completion?(response.result)
        })

        return request
    }
}
