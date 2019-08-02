//
//  HandlePlist.swift
//  Custom View
//
//  Created by PCI0007 on 8/2/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

class HandlePlist: UIViewController {
    
    static let shared = HandlePlist()
    
    var plistPath: String = ""
    var fileName: String = ""
    var rootPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
    lazy var plistInDocument = rootPath.appending("userPlist.plist")
    var fileManager = FileManager.default
    
    
    
    func readPlistFile(fileName: String) -> [[String: String]] {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "plist"),
            let arr = NSArray(contentsOfFile: path) as? [[String: String]] else { return [] }
        return arr
    }
    
    static func getPlist(fileName: String) -> [[String: String]]? {
        if let rootPath = Bundle.main.path(forResource: fileName, ofType: "plist"), let path = FileManager.default.contents(atPath: rootPath) {
            return (try? PropertyListSerialization.propertyList(from: path, options: .mutableContainersAndLeaves, format: nil)) as? [[String: String]]
        }
        return nil
    }
    
    func prepareForUse(filename: String) {
        if !fileManager.fileExists(atPath: plistInDocument) {
            guard let plistInBundle = Bundle.main.path(forResource: filename, ofType: "plist") else { return }
            do {
                try FileManager.default.copyItem(atPath: plistInBundle, toPath: plistInDocument)
            } catch {
                print("ERROR")
            }
        }
    }
}
