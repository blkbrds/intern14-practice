//
//  API.Location.swift
//  API
//
//  Created by MBA0217 on 10/22/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import Foundation

extension ApiManager.Location {
    struct QueryParam {
        func getListInLocation(oauth_token: String, v: String, lat: Float, long: Float, limit: Int, offset: Int) -> String {
            return ApiManager.Path.baseURL + ApiManager.Path.location + "?oauth_token=\(oauth_token)&v=\(v)&ll=\(lat),\(long)&limit=\(limit)&offset=\(offset)"
        }
    }
    
    struct LocationResult {
        var places: [Place]
        var page: Int
    }
    
    static func getListInLocation(oauth_token: String, v: String, lat: Float, long: Float, limit: Int = 10, offset: Int = 0, completion: @escaping APICompletion<LocationResult>) {
        let urlString = QueryParam().getListInLocation(oauth_token: oauth_token, v: v, lat: lat, long: long, limit: limit, offset: offset)
        
        API.shared().request(urlString: urlString) { (result) in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                if let data = data {
                    let json = data.convertToJSON()
                    let response = json["response"] as! [String: Any]
                    let groups = response["groups"] as! [[String: Any]]
                    
                    var places = [Place]()
                    
                    for gr in groups {
                        let items = gr["items"] as! [[String: Any]]
                        
                        for item in items {
                            let venue = item["venue"] as! [String: Any]
                            let name = venue["name"] as! String
                            
                            let tips = item["tips"] as! [[String: Any]]
                            
                            var avatar = ""
                            if let photo = tips[0]["photo"] as? [String : Any], let prefix = photo["prefix"] as? String, let suffix = photo["suffix"] as? String {
                                 avatar =  "\(prefix)\(ApiManager.Location.size)\(suffix)"
                            }
                            
                            let location = venue["location"] as! [String: Any]
                            let formattedAddress = location["formattedAddress"] as? [String]
                            let address = formattedAddress?[0]
                            let distance = location["distance"] as! Int
                            let rating = venue["rating"] as! Double
 
                            let place = Place(avatar: avatar, name: name, address: address, rating: Int(rating), distance: distance)
                            
                            places.append(place)
                        }
                    }
                    let page = offset / limit + 1
                    completion(.success(LocationResult(places: places, page: page)))
                } else {
                    completion(.failure(.error("Data is not format.")))
                }
            }
        }
    }
}
