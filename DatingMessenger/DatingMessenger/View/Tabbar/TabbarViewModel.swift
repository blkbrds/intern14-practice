//
//  TabbarViewModel.swift
//  DatingMessenger
//
//  Created by MBA0051 on 10/22/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class TabbarViewModel {

    init() {}
    
    var datas: [UIViewController] = []
    
    func getData(completion: () -> Void) {
        TabbarManager.getData { (datas) in
            self.datas = datas
            completion()
        }
    }
}
