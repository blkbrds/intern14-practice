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
        static let baseURLMovie = "https://rss.itunes.apple.com/api/v1/us/movies"
        static let movie = "/top-movies/all"
        static let baseURLVideo = "https://www.googleapis.com/youtube/v3/search?part=snippet&"
        static let key = "AIzaSyDIJ9UssMoN9IfR9KnTc4lb3B9NtHpRF"
        static let baseURLYouTube = "https://www.googleapis.com/youtube/v3/search?"
        static let abc = "https://www.googleapis.com/youtube/v3/search?pageToken=CDIQAA&part=snippet&maxResults=25&order=relevance&q=lactroi&key=AIzaSyDIJ9UssMoN9IfR9KnTc4lb3B9NtHpRF-c"
    }
    
    struct Movie {}
    
    struct YouTube {}
    
    struct Downloader {}
}
