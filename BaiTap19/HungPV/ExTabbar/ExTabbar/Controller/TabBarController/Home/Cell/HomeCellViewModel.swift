//
//  HomeTableViewModel.swift
//  ExTabbar
//
//  Created by PCI0010 on 9/16/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import Foundation
import UIKit

final class HomeCellViewModel {
    
    var name: String
    var artistName: String
    var releaseDate: String
    var artworkUrl100: String
    var artworkImage: UIImage?
    
    init(music: Music) {
        self.name = music.name
        self.artistName = music.artistName
        self.releaseDate = music.releaseDate
        self.artworkUrl100 = music.artworkUrl100
        self.artworkImage = music.artworkImage
    }
}
