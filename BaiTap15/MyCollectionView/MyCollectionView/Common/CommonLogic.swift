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
    private let ext: String = "plist"
    
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
    
    func loadGroupArrayFromPlist(plistName: String) -> [[String]] {
        var groupArray: [[String]] = [[]]
        guard let path = Bundle.main.url(forResource: plistName, withExtension: ext) else { return groupArray }
        guard let animalsPlist = NSArray(contentsOf: path) as? [Any]  else { return groupArray }

        for index in 0..<animalsPlist.count {
            guard let myArray = animalsPlist[index] as? [String] else { return groupArray }
            groupArray.append(myArray)
        }
        groupArray.remove(at: 0)
        return groupArray
    }
    
    func loadDefaultAnimalIndex() -> [String] {
        var animalsIndex: [String] = []
        // Create animal index
        animalsIndex.append("Home")
        animalsIndex.append("Reptiles")
        animalsIndex.append("Pantheras")
        animalsIndex.append("Herbivores")
        return animalsIndex
    }
}
