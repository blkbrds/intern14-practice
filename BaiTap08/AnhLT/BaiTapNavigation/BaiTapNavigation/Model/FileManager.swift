//
//  File.swift
//  BaiTapNavigation
//
//  Created by PCI0013 on 7/11/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import Foundation

class Manager {
//readfrombundle
    static func readPlistFile(filename: String) -> [[String: String]] {
    guard let path = Bundle.main.path(forResource: filename, ofType: "plist"),
        let arr = NSArray(contentsOfFile: path) as? [[String: String]] else { return [] }
        return arr
    }

//readfromdocument
    static func readPlist(namePlist: String) -> [[String: String]] {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
        let documentsDirectory = paths.object(at: 0) as! NSString
        let path = documentsDirectory.appendingPathComponent(namePlist + ".plist")
        print(path)
        
        if let dict = NSArray(contentsOfFile: path) {
            return dict as! [[String : String]]
        } else {
            guard let privPath = Bundle.main.path(forResource: namePlist, ofType: "plist") else { return [] }
            return NSArray(contentsOfFile: privPath) as! [[String : String]]
        }
    }

//copyfrombundletodocument
    static func copyFilesFromBundleToDocumentsFolderWith(fileExtension: String) {
        if let resPath = Bundle.main.resourcePath {
            do {
                let dirContents = try FileManager.default.contentsOfDirectory(atPath: resPath)
                let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
                let filteredFiles = dirContents.filter{ $0.contains(fileExtension)}
                for fileName in filteredFiles {
                    if let documentsURL = documentsURL {
                        let sourceURL = Bundle.main.bundleURL.appendingPathComponent(fileName)
                        let destURL = documentsURL.appendingPathComponent(fileName)
                        print(destURL)
                        do { try FileManager.default.copyItem(at: sourceURL, to: destURL) } catch { }
                    }
                }
            } catch { }
        }
    }

//writePlist
    static func writePlist(_ user: User, _ username: String) {
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let path = documentDirectory.appending("/UP.plist")
        let data: [String: String] = ["username" : user.username, "password" : user.password]
        let someData = NSArray(object: data)
        if var dataSources = NSArray(contentsOfFile: path) as? [[String: String]] {
            for index in 0..<dataSources.count {
                if dataSources[index]["username"] == user.username {
                    dataSources[index]["password"] = user.password
                }
            }
            print(dataSources)
            print(someData)

            (dataSources as NSArray).write(toFile: path, atomically: true)
        } else {
        let isWritten = someData.write(toFile: path, atomically: true)
        print("is the file created: \(isWritten)")
        }
    }
//writePlistEx03
    
    static func writePlistAvatar(_ user: Avatar, _ username: String) {
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let path = documentDirectory.appending("/Avatar.plist")
        let data: [String: String] = ["username" : user.username, "avatar" : user.userImage]
        let someData = NSArray(object: data)
        if var dataSources = NSArray(contentsOfFile: path) as? [[String: String]] {
            for index in 0..<dataSources.count {
                if dataSources[index]["avatar"] == user.userImage {
                    dataSources[index]["username"] = user.username
                }
            }
            print(dataSources)
            print(someData)
            
            (dataSources as NSArray).write(toFile: path, atomically: true)
        } else {
            let isWritten = someData.write(toFile: path, atomically: true)
            print("is the file created: \(isWritten)")
        }
    }
}

