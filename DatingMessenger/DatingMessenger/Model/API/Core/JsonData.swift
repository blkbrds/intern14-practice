//
//  JsonData.swift
//  DatingMessenger
//
//  Created by MBA0051 on 10/24/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import Foundation

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
