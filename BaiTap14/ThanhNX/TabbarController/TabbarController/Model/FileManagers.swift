//
//  FileManagers.swift
//  TabbarController
//
//  Created by PCI0008 on 8/22/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import Foundation

final class FileManagers: BaseViewController {
    //MARK: - Read file    
    static func readPlistFile(filename: String) -> [[String: String]] {
        var path = ""
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        if let _ = NSArray(contentsOfFile: documentDirectory.appending("/" + filename + ".plist")) {
            path = documentDirectory.appending("/" + filename + ".plist")
        } else {
            guard let paths = Bundle.main.path(forResource: filename, ofType: "plist") else { return [] }
            path = paths
        }
        guard let arr = NSArray(contentsOfFile: path) as? [[String: String]] else { return [] }
        writePlistFile(filename: filename + ".plist", data: arr as NSArray)
        return arr
    }
    
    //MARK: - Write file
    static func writePlistFile(filename: String, data: NSArray) {
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let path = documentDirectory.appending("/" + filename)
        let plistContent = NSArray(array: data)
        let success: Bool = plistContent.write(toFile: path, atomically: true)
        if success {
            print("file has been created!")
        } else {
            print("unable to create the file")
        }
    }
    
    //MARK: Add new person
    static func writePlist(filename: String, user: User) {
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let path = documentDirectory.appending("/" + filename + ".plist")
        let data: [String: String] = ["password" : user.password, "username" : user.username]
        let someData = NSArray(object: data)
        if var dataSoucres = NSArray(contentsOfFile: path) as? [[String: String]] {
            dataSoucres.append(data)
            writePlistFile(filename: filename + ".plist", data: dataSoucres as NSArray)
        } else {
            let isWritten = someData.write(toFile: path, atomically: true)
            print("Created file: \(isWritten)")
        }
    }
}
