//
//  TabBarItemController.swift
//  DatingMessenger
//
//  Created by MBA0051 on 10/21/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import Foundation
import UIKit

enum TabBarItems: String {
    case Messages
    case Contacts
    case Schedules
    case MyPage
}

struct TabBarItemController {
    
    let controller: UIViewController
    let imageEnbled: String
    let imageDisabled: String
    private let controllerName: String
    
    
    init(itemType: TabBarItems) {
        switch itemType {
        case .Messages:
            self.controllerName = AppConstants.TabBarItems.Messages.name
            self.controller = MessageHomeViewController()
            self.imageEnbled = AppConstants.TabBarItems.Messages.imageEnbled
            self.imageDisabled = AppConstants.TabBarItems.Messages.imageDisabled
        case .Contacts:
            self.controllerName = AppConstants.TabBarItems.Contacts.name
            self.controller = ContactHomeViewController()
            self.imageEnbled = AppConstants.TabBarItems.Contacts.imageEnbled
            self.imageDisabled = AppConstants.TabBarItems.Contacts.imageDisabled
        case .Schedules:
            self.controllerName = AppConstants.TabBarItems.Schedules.name
            self.controller = ScheduleHomeViewController()
            self.imageEnbled = AppConstants.TabBarItems.Schedules.imageEnbled
            self.imageDisabled = AppConstants.TabBarItems.Schedules.imageDisabled
        case .MyPage:
            self.controllerName = AppConstants.TabBarItems.MyPage.name
            self.controller = MyPageViewController()
            self.imageEnbled = AppConstants.TabBarItems.MyPage.imageEnbled
            self.imageDisabled = AppConstants.TabBarItems.MyPage.imageDisabled
        }
    }
}
