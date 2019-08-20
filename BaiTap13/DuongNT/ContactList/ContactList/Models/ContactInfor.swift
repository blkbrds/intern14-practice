//
//  ContactInfor.swift
//  ContactList
//
//  Created by Nguyen Duong on 8/18/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import Foundation

struct Contact {
    var avatarImg: String
    var email: String
    var fullName: String
    var address: String
    var phone: String
    var dateOfBirth: Date
    var gender: Bool

    init(avatarImg: String, email: String, fullName: String, address: String, phone: String, dateOfBirth: Date, gender: Bool) {
        self.avatarImg = avatarImg
        self.email = email
        self.fullName = fullName
        self.address = address
        self.phone = phone
        self.dateOfBirth = dateOfBirth
        self.gender = gender
    }
}
