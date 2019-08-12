//
//  FileManagers.swift
//  Protocol
//
//  Created by Nguyen Duong on 8/12/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
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

    static func writePlistToList(_ user: Users, _ name: String) {
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let path = documentDirectory.appending("/ListUserInform.plist")
        let data: [String: String] = ["name" : user.name, "avatar" : user.avatar]
        let someData = NSArray(object: data)
        if var dataSoucres = NSArray(contentsOfFile: path) as? [[String: String]] {
            var i = 0
            dataSoucres.forEach {
                userDetail in
                var a = userDetail.filter {
                    $0.value == name
                }
                if a.count != 0 {
                    a.updateValue(user.name, forKey: "name")
                    a.updateValue(user.avatar, forKey: "avatar")
                    dataSoucres.insert(a, at: i)
                    dataSoucres.remove(at: i + 1)
                }
                i += 1
            }
            (dataSoucres as NSArray).write(toFile: path, atomically: true)
            print("Luu ok")
            
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
