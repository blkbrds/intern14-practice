//
//  HomeCollectionViewModel.swift
//  ExCollectionViewHomeScreen
//
//  Created by PCI0010 on 9/12/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import Foundation
import UIKit

final class HomeCollectionViewModel {
    
    //MARK: Properties
    var name: String
    var location: String
    var rating: Int
    var distance: Float
    var avatarImage: UIImage
    var isFavorite: Bool
    
    init(place: Place) {
        self.name = place.name
        self.location = place.location
        self.rating = place.rating
        self.distance = place.distance
        self.avatarImage = place.avatar
        self.isFavorite = place.isFavorite
    }
    
    func changeFavorite(completion: (Bool) -> ()) {
        isFavorite = !isFavorite
        completion(true)
    }
}
