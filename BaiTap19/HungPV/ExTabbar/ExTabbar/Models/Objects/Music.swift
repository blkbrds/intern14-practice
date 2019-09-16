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
    var artworkUrl100: UIImage
    
    init(name: String, artistName: String, releaseDate: String, artworkUrl100: UIImage) {
        self.name = name
        self.artistName = artistName
        self.releaseDate = releaseDate
        self.artworkUrl100 = artworkUrl100
    }

}

extension Music {
    static func dummyData() -> [Music] {
        let newMusic: [Music] = {
            let music1 = Music(name: "Don't Call Me Angel (Charlie's Angels)", artistName: "Ariana Grande, Miley Cyrus & Lana Del Rey", releaseDate: "2019-09-13", artworkUrl100: UIImage(named: "ic-car1")!)
            let music2 = Music(name: "Don't Call Me Angel (Charlie's Angels)", artistName: "Ariana Grande, Miley Cyrus & Lana Del Rey", releaseDate: "2019-09-13", artworkUrl100: UIImage(named: "ic-car2")!)
            let music3 = Music(name: "Don't Call Me Angel (Charlie's Angels)", artistName: "Ariana Grande, Miley Cyrus & Lana Del Rey", releaseDate: "2019-09-13", artworkUrl100: UIImage(named: "ic-car3")!)
            let music4 = Music(name: "Don't Call Me Angel (Charlie's Angels)", artistName: "Ariana Grande, Miley Cyrus & Lana Del Rey", releaseDate: "2019-09-13", artworkUrl100: UIImage(named: "ic-car4")!)
            let music5 = Music(name: "Don't Call Me Angel (Charlie's Angels)", artistName: "Ariana Grande, Miley Cyrus & Lana Del Rey", releaseDate: "2019-09-13", artworkUrl100: UIImage(named: "ic-car5")!)
            return [music1,music2,music3,music4,music5]
        }()
        return newMusic
    }
}
