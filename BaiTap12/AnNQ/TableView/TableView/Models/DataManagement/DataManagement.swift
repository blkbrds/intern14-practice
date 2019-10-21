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
    
    func getExercises(fileName: String, type: String) -> [Exercise] {
        let array = NSArray(contentsOfFile: getFileDocumentPath(fileName: fileName, type: type))
        var exercises: [Exercise] = [] 
        for item in array! {
            let dict = item as! NSDictionary
            let ex = Exercise(name: dict.object(forKey: "name") as! String,
                              description: dict.object(forKey: "description") as! String)
            exercises.append(ex)
        }
        return exercises
    }
    
    // MARK: - private function
    func getFileDocumentPath(fileName: String, type: String) -> String {
        return (Bundle.main.path(forResource: fileName, ofType: type)) ?? ""
    }
    
    func loadDataTypeString(fileName: String, type: String) -> [String] {
        let path = getFileDocumentPath(fileName: fileName, type: type)
        let array = NSArray(contentsOfFile: path) as! [String]
        return array
    }
    
    func getUser(fileName: String, type: String) -> [User] {
        let array = NSArray(contentsOfFile: getFileDocumentPath(fileName: fileName, type: type))
        var users: [User] = []
        for item in array! {
            let dict = item as! NSDictionary
            let usr = User(name: dict.object(forKey: "name") as! String, subTitle: dict.object(forKey: "sub_title") as! String, avatar: dict.object(forKey: "avatar") as! String)
            users.append(usr)
        }
        
        return users
    }
    
    func getAnimal(fileName: String, type: String) -> [Animal] {
        let array = NSArray(contentsOfFile: getFileDocumentPath(fileName: fileName, type: type))
        var animals: [Animal] = []
        for item in array! {
            let dict = item as! NSDictionary
            let anm = Animal(name: dict.object(forKey: "name") as! String, subTitle: dict.object(forKey: "sub_title") as! String, avatar: dict.object(forKey: "avatar") as! String)
            animals.append(anm)
        }
        
        return animals
    }
}
