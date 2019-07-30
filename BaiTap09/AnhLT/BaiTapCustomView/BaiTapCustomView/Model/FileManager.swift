//
//  FileManager.swift
//  BaiTapCustomView
//
//  Created by PCI0013 on 7/23/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import Foundation

class Manager {
    // readfromdocument
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

    // copyfrombundletodocument
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
    
    //writePlistEx01
    
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
