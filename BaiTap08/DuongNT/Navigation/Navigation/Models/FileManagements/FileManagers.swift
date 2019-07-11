//
//  FileManager.swift
//  Navigation
//
//  Created by Nguyen Duong on 7/10/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import Foundation
class FileManagers {
    
    //MARK: - Read file
    
    static func readPlistFile(filename: String) -> [[String: String]] {
        guard let path = Bundle.main.path(forResource: filename, ofType: "plist") else { return [] }
        return NSArray(contentsOfFile: path) as! [[String : String]]
    }
    
    //MARK: - Write file
    
    static func readPlist(namePlist: String) -> [[String: String]] {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
        let documentsDirectory = paths.object(at: 0) as! NSString
        let path = documentsDirectory.appendingPathComponent(namePlist + ".plist")
        
        if let dict = NSArray(contentsOfFile: path) {
            return dict as! [[String : String]]
        } else {
            guard let privPath = Bundle.main.path(forResource: namePlist, ofType: "plist") else { return [] }
            return NSArray(contentsOfFile: privPath) as! [[String : String]]
        }
    }
    
    static func writePlist(_ username: String, _ password: String) {
        let fileManager = FileManager.default
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let path = documentDirectory.appending("/users.plist")
        if(!fileManager.fileExists(atPath: path)){
            print(path)
            let data : [String: String] = ["username" : username, "password" : password]
            let someData = NSDictionary(dictionary: data)
            let isWritten = someData.write(toFile: path, atomically: true)
            print("is the file created: \(isWritten)")
        } else {
            let data : [String: String] = ["username" : username, "password" : password]
            let someData = NSDictionary(dictionary: data)
            let isWritten = someData.write(toFile: path, atomically: true)
            print("is the file created: \(isWritten)")
        }
    }
}
