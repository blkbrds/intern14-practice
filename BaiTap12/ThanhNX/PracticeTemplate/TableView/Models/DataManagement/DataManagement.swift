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
    
    func getPresident(fileName: String, type: String) -> [String] {
        let array = NSArray(contentsOfFile: getFileDocumentPath(fileName: fileName, type: type))
        var names: [String] = []
        for item in array! {
            let dict = item as! NSDictionary
            let ex = dict.object(forKey: "name") as! String
            names.append(ex)
        }
        return names
    }
    
    func getName(fileName: String, type: String) -> [UserName] {
        let array = NSArray(contentsOfFile: getFileDocumentPath(fileName: fileName, type: type))
        var names: [UserName] = []
        for item in array! {
            let dict = item as! NSDictionary
            let ex = UserName(name: dict.object(forKey: "name") as! String)
            names.append(ex)
        }
        return names
    }
    
    // MARK: - private function
    func getFileDocumentPath(fileName: String, type: String) -> String {
        return (Bundle.main.path(forResource: fileName, ofType: type)) ?? ""
    }
}
