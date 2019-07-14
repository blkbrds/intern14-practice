//
//  FileManager.swift
//  BaiTapNavigation
//
//  Created by PCI0001 on 7/11/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import Foundation

class FileManager {
    
    //MARK: - Read file
    static func readPlistFile(filename: String) -> [[String: String]] {
        guard let path = Bundle.main.path(forResource: filename, ofType: "plist"),
            let arr = NSArray(contentsOfFile: path) as? [[String: String]] else { return [] }
        return arr
    }
    
    //MARK: - Write file
}
