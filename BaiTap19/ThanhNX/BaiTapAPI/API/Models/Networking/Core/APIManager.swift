//
//  APIManager.swift
//  BaiTapAPI
//
//  Created by PCI0008 on 8/27/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import Foundation

struct APIManager {
    struct Path {
        static let baseURL = "https://rss.itunes.apple.com/api/v1/us/movies"
        static let movie = "/top-movies/all"
    }
    
    struct Movie {}
    
    struct Downloader {}
}
