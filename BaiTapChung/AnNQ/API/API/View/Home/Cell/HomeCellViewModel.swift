//
//  HomeCellViewModel.swift
//  API
//
//  Created by MBA0217 on 10/21/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import Foundation
import UIKit

final class HomeCellViewModel {
    var avatar: String?
    var name: String
    var address: String?
    var rating: Int?
    var distance: Int?
    
    init(place: Place) {
        self.avatar = place.avatar
        self.name = place.name
        self.address = place.address
        self.rating = place.rating
        self.distance = place.distance
    }
    
    func updateAvatar(imageView: UIImageView) {
        if let url = URL(string: self.avatar ?? "") {
            let image = try? Data(contentsOf: url)
            imageView.image = UIImage(data: image!)
        }
    }
}
