//
//  AppConstants.swift
//  DatingMessenger
//
//  Created by MBA0051 on 10/21/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import Foundation

struct AppConstants {
    
    // Call to API.
    static let protocolo    : String = "http://"
    static let apiVersion   : String = "/api"
    static let domain       : String = "whoami.website"
    static let baseUrl      : String = AppConstants.protocolo + AppConstants.domain + AppConstants.apiVersion
    
    struct TabBarItems {
        
        struct  Messages {
            static let name =  "MessageHomeViewController"
            static let imageEnbled = "avatar.png"
            static let imageDisabled = "avatar.png"
        }
        
        struct Contacts {
            static let name =  "ContactHomeViewController"
            static let imageEnbled = "avatar.png"
            static let imageDisabled = "avatar.png"
        }

        struct Schedules {
            static let name =  "ScheduleHomeViewController"
            static let imageEnbled = "avatar.png"
            static let imageDisabled = "avatar.png"
        }

        struct MyPage {
            static let name =  "MyPageViewController"
            static let imageEnbled = "avatar.png"
            static let imageDisabled = "avatar.png"
        }
    }
}
