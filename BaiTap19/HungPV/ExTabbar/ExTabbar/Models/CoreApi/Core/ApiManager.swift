//
//  ApiManager.swift
//  ExTabbar
//
//  Created by PCI0010 on 9/16/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import Foundation

struct ApiManager {
    struct Path {
        static let baseURL = "https://rss.itunes.apple.com/api/v1/us"
        static let apple_music = "/apple-music"
        static let hot_tracks = "/hot-tracks"
        static let music_all = "/all"
    }
    
    struct Audio {}
    
    struct Downloader {}
    
    struct Music {}
}
