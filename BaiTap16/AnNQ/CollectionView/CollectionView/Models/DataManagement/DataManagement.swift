//
//  DataManagement.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import Foundation

class DataManagement {
    // MARK: - Signleton
    public static var share: DataManagement = {
        let dataManagement = DataManagement()
        return dataManagement
    }()
    // MARK: - public function
    init() {
        
    }
    
    func getPlaces(fileName: String, type: String) -> [Place] {
        let array = NSArray(contentsOfFile: getFileDocumentPath(fileName: fileName, type: type))
        var places: [Place] = []
        for item in array! {
            let dict = item as! NSDictionary
            let ex = Place(name: dict.object(forKey: "name") as! String, address: dict.object(forKey: "address") as! String, point: dict.object(forKey: "point") as! Int, distance: dict.object(forKey: "distance") as! Int, image: dict.object(forKey: "image") as! String)
            places.append(ex)
        }
        return places
    }
    
    // MARK: - private function
    func getFileDocumentPath(fileName: String, type: String) -> String {
        return (Bundle.main.path(forResource: fileName, ofType: type)) ?? ""
    }
}
