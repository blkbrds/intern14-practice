//
//  API.Movie.swift
//  BaiTapAPI
//
//  Created by PCI0008 on 8/27/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import Foundation

extension APIManager.Movie {
    struct QueryString {
        func getTop(num: Int) -> String {
            return APIManager.Path.baseURLMovie + APIManager.Path.movie + "/\(num)/explicit.json"
        }
    }
    
    static func getTop(num: Int = 10, completion: @escaping APICompletion<[Movie]>) {
        let urlString = QueryString().getTop(num: num)
        
        API.shared().request(urlString: urlString) { (result) in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                if let data = data {
                    let json = data.convertToJSON()
                    guard let feed = json["feed"] as? [String: Any],
                        let results = feed["results"] as? [[String: Any]], let title = feed["title"] as? String else { return }
                    
                    var movies = [Movie]()
                    
                    for item in results {
                        guard let name = item["name"] as? String, let artWork = item["artworkUrl100"] as? String else { return }
                        
                        let movie = Movie(imageStr: artWork, thumbnail: nil, movieName: name, title: title)
                        movies.append(movie)
                    }
                    
                    completion(.success(movies))
                } else {
                    completion(.failure(.error("Data is not value")))
                }
            }
        }
    }
}
