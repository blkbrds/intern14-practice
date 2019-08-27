//
//  API.YouTube.swift
//  BaiTapAPI
//
//  Created by PCI0008 on 8/27/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import Foundation

extension APIManager.YouTube {
    struct QueryString {
        func getTop(keyword: String) -> String {
            return APIManager.Path.baseURLVideo + "q=\(keyword)&type=video&" +  "key=\(APIManager.Path.key)-c"
        }
    }
    
    static func getTop(keyword: String, completion: @escaping APICompletion<[YouTube]>) {
        let urlString = QueryString().getTop(keyword: keyword)
        
        API.shared().request(urlString: urlString) { (result) in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                if let data = data {
                    let json = data.convertToJSON()
                    guard let items = json["items"] as? [[String: Any]] else { return }
                    
                    var videos = [YouTube]()
                    
                    for item in items {
                        guard let snippet = item["snippet"] as? [String: Any],
                            let publishedAt = snippet["publishedAt"] as? String,
                            let channelTitle = snippet["channelTitle"] as? String,
                            let titleVideo = snippet["title"] as? String,
                            let thumbnails = snippet["thumbnails"] as? [String: Any],
                            let medium = thumbnails["medium"] as? [String: Any],
                            let imageStr = medium["url"] as? String else { return }
                        let youtube = YouTube(titleVideo: titleVideo, thumbnail: nil, publishedAt: publishedAt, channelTitle: channelTitle, imageStr: imageStr)
                        videos.append(youtube)
                    }
                    
                    completion(.success(videos))
                } else {
                    completion(.failure(.error("Data is not value")))
                }
            }
        }
    }
}
