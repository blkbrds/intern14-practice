//
//  Music.swift
//  ExTabbar
//
//  Created by PCI0010 on 9/16/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import Foundation
import UIKit

final class Music {
    
    var name: String
    var artistName: String
    var releaseDate: String
    var artworkUrl100: String
    var artworkImage: UIImage?
    
//    init(name: String, artistName: String, releaseDate: String, artworkUrl100: String) {
//        self.name = name
//        self.artistName = artistName
//        self.releaseDate = releaseDate
//        self.artworkUrl100 = artworkUrl100
//    }
    
    init(dic: [String : Any]) {
        let name = dic["name"] as! String
        self.name = name
        let artistName = dic["artistName"] as! String
        self.artistName = artistName
        let releaseDate = dic["releaseDate"] as! String
        self.releaseDate = releaseDate
        let artworkUrl100 = dic["artworkUrl100"] as! String
        self.artworkUrl100 = artworkUrl100
    }

}
