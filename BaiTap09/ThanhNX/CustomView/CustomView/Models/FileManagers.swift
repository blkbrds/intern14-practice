//
//  FileManagers.swift
//  CustomView
//
//  Created by PCI0008 on 7/18/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import Foundation

final class FileManagers {
    //MARK: - Read file
    static func readPlistFile(filename: String) -> [[String: String]] {
        var path = ""
        if let _ = UserDefaults.standard.string(forKey: "name") {
            let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
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
        let _: Bool = plistContent.write(toFile: path, atomically: true)
    }
}
