//
//  CommonReusable.swift
//  DatingMessenger
//
//  Created by MBA0051 on 10/19/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class CommonReusable {
    static let shared = CommonReusable()
    
    private init() {}
    
    func createCircleImage(view: UIImageView, named: String) {
        view.image = UIImage(named: named)
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 40
        view.layer.masksToBounds = true
    }
}
