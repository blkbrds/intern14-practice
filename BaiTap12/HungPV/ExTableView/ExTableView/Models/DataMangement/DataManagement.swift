//
//  DataManagement.swift
//  ExTableView
//
//  Created by PCI0010 on 9/5/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import Foundation

class DataManagement {
    // MARK: - Signleton
    public static var share: DataManagement = {
        let dataManagement = DataManagement()
        return dataManagement
    }()
    // MARK: - public function
    init() {
        
    }
    
    func getNameAcc(fileName: String, type: String) -> [String] {
        let array = NSArray(contentsOfFile: getFileDocumentPath(fileName: fileName, type: type))
        var nameAcc: [String] = []
        for item in array! {
            let dict = item as! NSDictionary
            let ex = dict.object(forKey: "name") as! String
            nameAcc.append(ex)
        }
        return nameAcc
    }
    
    // MARK: - private function
    func getFileDocumentPath(fileName: String, type: String) -> String {
        return (Bundle.main.path(forResource: fileName, ofType: type)) ?? ""
    }
}
