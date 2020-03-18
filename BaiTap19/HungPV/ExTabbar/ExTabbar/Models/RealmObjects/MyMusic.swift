//
//  MyMusic.swift
//  ExTabbar
//
//  Created by PCI0010 on 9/19/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import Foundation
import RealmSwift

final class MyMusic: Object {
    typealias JSON = [String: Any]
    
    @objc dynamic var name: String = ""
    @objc dynamic var artistName: String = ""
    @objc dynamic var releaseDate: String = ""
    @objc dynamic var artworkUrl100: String = ""
    dynamic var artworkImage: UIImage?
    
    convenience init(dic: JSON) {
        var schema: [String: Any] = [:]
        if let name = dic["name"] {
            schema["name"] = name
        }
        if let artistName = dic["artistName"] {
            schema["artistName"] = artistName
        }
        if let releaseDate = dic["releaseDate"] {
            schema["releaseDate"] = releaseDate
        }
        if let artworkUrl100 = dic["artworkUrl100"] {
            schema["artworkUrl100"] = artworkUrl100
        }
        self.init(value: schema)
    }
    
    override static func primaryKey() -> String? {
        return "name"
    }
}
