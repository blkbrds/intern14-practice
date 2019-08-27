//
//  API.Downloader.swift
//  BaiTapAPI
//
//  Created by PCI0008 on 8/27/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import Foundation
import UIKit

extension APIManager.Downloader {
    static func downloadImage(imageURL: String, index: Int, completion: @escaping (UIImage?, Int) -> Void) {
        API.shared().request(urlString: imageURL) { (result) in
            switch result {
            case .failure(_):
                completion(nil, index)
            case .success(let data):
                if let data = data,
                    let image = UIImage(data: data) {
                    completion(image, index)
                } else {
                    completion(nil, index)
                }
            }
        }
    }
}
