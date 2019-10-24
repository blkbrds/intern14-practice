//
//  ApiManager.swift
//  API
//
//  Created by MBA0217 on 10/22/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import Foundation

struct ApiManager {
    struct Path {
        static let baseURL = "https://api.foursquare.com/v2/venues"
        static let location = "/explore"
    }
    
    struct Location {
        static let size = "80x80"
        static let oath_token: String = "3IHPZFJ0LWOKCHTHQMWAOZMX40VQV0S3PMZKNUMYZGHUP4WJ"
    }
}
