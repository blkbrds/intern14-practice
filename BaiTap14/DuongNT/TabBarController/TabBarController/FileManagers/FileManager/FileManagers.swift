//
//  FileManagers.swift
//  TabBarController
//
//  Created by Nguyen Duong on 8/22/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import Foundation

class FileManagers {
    
    //MARK: - Read file
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
    
    static func writePlist(_ user: User, _ username: String) {
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let path = documentDirectory.appending("/users.plist")
        let data: [String: String] = ["username" : user.username, "password" : user.password]
        let someData = NSArray(object: data)
        if var dataSoucres = NSArray(contentsOfFile: path) as? [[String: String]] {
            var i = 0
            dataSoucres.forEach {
                userDetail in
                var a = userDetail.filter {
                    $0.value == username
                }
                if a.count != 0 {
                    a.updateValue(user.username, forKey: "username")
                    a.updateValue(user.password, forKey: "password")
                    dataSoucres.insert(a, at: i)
                    dataSoucres.remove(at: i)
                }
                i += 1
                
            }
            (dataSoucres as NSArray).write(toFile: path, atomically: true)
            
        } else {
            let isWritten = someData.write(toFile: path, atomically: true)
            print("is the file created: \(isWritten)")
        }
    }

    static func writePlist(_ user: User) {
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let path = documentDirectory.appending("/users.plist")
        let data: [String: String] = ["username" : user.username, "password" : user.password]
        let someData = NSArray(object: data)
        if var dataSoucres = NSArray(contentsOfFile: path) as? [[String: String]] {
            dataSoucres.append(data)
            (dataSoucres as NSArray).write(toFile: path, atomically: true)
        } else {
            let isWritten = someData.write(toFile: path, atomically: true)
            print("is the file created: \(isWritten)")
        }
    }

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
}
