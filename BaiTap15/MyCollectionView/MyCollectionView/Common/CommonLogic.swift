//
//  CommonLogic.swift
//  MyCollectionView
//
//  Created by MBA0051 on 10/18/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class CommonLogic {
    
    static let share: CommonLogic = CommonLogic()
    
    private init() {}
    
    func getListImage() -> [UIImage] {
        return [
            UIImage(named: "favorite_selected.png")!,
            UIImage(named: "favorite.png")!,
            UIImage(named: "home_selected.png")!,
            UIImage(named: "home.png")!,
            UIImage(named: "map_selected.png")!,
            UIImage(named: "map.png")!,
            UIImage(named: "profile_selected.png")!,
            UIImage(named: "profile.png")!
        ]
    }
    
    func getUsersInformation() -> [PersonInfo] {
        return [
            PersonInfo(personImage: UIImage(named: "favorite.png")!, personName: "favorite"),
            PersonInfo(personImage: UIImage(named: "favorite_selected.png")!, personName: "favorite selected"),
            PersonInfo(personImage: UIImage(named: "home.png")!, personName: "home"),
            PersonInfo(personImage: UIImage(named: "home_selected.png")!, personName: "home selected"),
            PersonInfo(personImage: UIImage(named: "map.png")!, personName: "map"),
            PersonInfo(personImage: UIImage(named: "map_selected.png")!, personName: "map selected"),
            PersonInfo(personImage: UIImage(named: "profile.png")!, personName: "profile"),
            PersonInfo(personImage: UIImage(named: "profile_selected.png")!, personName: "profile selected")
        ]
    }
}
