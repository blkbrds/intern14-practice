//
//  DataManagement.swift
//  ExCustomView
//
//  Created by PCI0010 on 8/19/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import Foundation
class DataManagement {
    
    // MARK: - Signleton
    public static var share: DataManagement = {
        let dataManagement = DataManagement()
        return dataManagement
    }()
    
    private init() {}
    
    func getFileDocumentPath(fileName: String, type: String) -> String {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let url = NSURL(fileURLWithPath: path)
        if let pathComponent = url.appendingPathComponent("\(fileName).\(type)") {
            let filePath = pathComponent.path
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: filePath) {
                return filePath
            } else {
                return (Bundle.main.path(forResource: fileName, ofType: type)) ?? ""
            }
        } else {
            return (Bundle.main.path(forResource: fileName, ofType: type)) ?? ""
        }
    }
    
    func getListUserAvatar(fileName: String, type: String) -> [Users] {
        let path = getFileDocumentPath(fileName: fileName, type: type)
        print("Path: " + path)
        let array = NSArray(contentsOfFile: path)
        var userInfos: [Users] = []
        for item in array! {
            let dict = item as! NSDictionary
            let ex = Users(name: dict.object(forKey: "name") as! String, avatar: dict.object(forKey: "avatar") as! String)
            userInfos.append(ex)
        }
        return userInfos
    }

    func writePlistToList(user: Users, name: String) {
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let path = documentDirectory.appending("/ListUsers.plist")
        let data: [String: String] = ["name" : user.name, "avatar" : user.avatar]
        let someData = NSArray(object: data)
        if var dataSource = NSArray(contentsOfFile: path) as? [[String: String]] {
            var i = 0
            
            for item in dataSource {
                if item["name"] == user.name {
                    dataSource[i]["name"] = name
                }
                i += 1
            }
            (dataSource as NSArray).write(toFile: path, atomically: true)
            
        } else {
            let isWritten = someData.write(toFile: path, atomically: true)
            print("is the file created: \(isWritten)")
        }
    }
    
    func preparePlistForUseAvatar() {
        let rootPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, .userDomainMask, true)[0]
        let plistPathInDocument = rootPath.appendingFormat("/UserAvatar.plist")
        if !FileManager.default.fileExists(atPath: plistPathInDocument) {
            guard let plistPathInBundle = Bundle.main.path(forResource: "UserAvatar", ofType: "plist") else { return }
            do {
                try FileManager.default.copyItem(atPath: plistPathInBundle, toPath: plistPathInDocument)
            } catch {
                print("Error occurred while copying file to document \(error)")
            }
        }
}
}
