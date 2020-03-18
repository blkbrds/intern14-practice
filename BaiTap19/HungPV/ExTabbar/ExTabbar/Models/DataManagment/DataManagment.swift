//
//  DataManagment.swift
//  ExTabbar
//
//  Created by PCI0010 on 9/9/19.
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
    
//    func getListUserInfo(fileName: String, type: String) -> [User] {
//        let path = getFileDocumentPath(fileName: fileName, type: type)
//        print("Path: " + path)
//        let array = NSArray(contentsOfFile: path)
//        var userInfos: [User] = []
//        for item in array! {
//            let dict = item as! NSDictionary
//            let ex = User(username: dict.object(forKey: "username") as! String,
//                              password: dict.object(forKey: "password") as! String)
//            userInfos.append(ex)
//        }
//        return userInfos
//    }
    
    // MARK: - private function
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
    
    func preparePlistForUse() {
        let rootPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, .userDomainMask, true)[0]
        let plistPathInDocument = rootPath.appendingFormat("/Users.plist")
        if !FileManager.default.fileExists(atPath: plistPathInDocument) {
            guard let plistPathInBundle = Bundle.main.path(forResource: "Users", ofType: "plist") else { return }
            do {
                try FileManager.default.copyItem(atPath: plistPathInBundle, toPath: plistPathInDocument)
            } catch {
                print("Error occurred while copying file to document \(error)")
            }
        }
    }
}
