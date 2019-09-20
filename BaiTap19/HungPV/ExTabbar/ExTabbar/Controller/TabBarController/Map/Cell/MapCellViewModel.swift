//
//  MapCellViewModel.swift
//  ExTabbar
//
//  Created by PCI0010 on 9/19/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import Foundation
import UIKit

final class MapCellViewModel {
    var name: String
    var artistName: String
    var releaseDate: String
    var artworkUrl100: String
    var artworkImage: UIImage?
    
    init(myMusic: MyMusic) {
        self.name = myMusic.name
        self.artistName = myMusic.artistName
        self.releaseDate = myMusic.releaseDate
        self.artworkUrl100 = myMusic.artworkUrl100
        self.artworkImage = myMusic.artworkImage
    }
}
