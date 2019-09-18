//
//  API+Data.swift
//  ExTabbar
//
//  Created by PCI0010 on 9/16/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import Foundation

typealias JSON = [String: Any] 
extension Data {
    func convertToJSON() -> [String: Any] {
        var json: [String: Any] = [:]
        do {
            if let jsonObj = try JSONSerialization.jsonObject(with: self, options: .mutableContainers) as? [String: Any] {
                json = jsonObj
            }
        } catch {
            print("JSON casting error")
        }
        return json
    }
}
