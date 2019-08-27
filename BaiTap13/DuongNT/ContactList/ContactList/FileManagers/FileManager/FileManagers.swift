//
//  FileManagers.swift
//  ContactList
//
//  Created by Nguyen Duong on 8/18/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import Foundation

class FileManagers {
    public static var share: FileManagers = {
        let fileManager = FileManagers()
        return fileManager
    }()

    // MARK: - Public function
    init() {
    }

    func getContacts(fileName: String, type: String) -> [Contact] {
        let array = NSArray(contentsOfFile: getFileDocumentPath(fileName: fileName, type: type))
        var contacts: [Contact] = []
        for item in array! {
            let dict = item as! NSDictionary
            let contact = Contact(avatarImg: dict.object(forKey: "avatarImg") as! String, email: dict.object(forKey: "email") as! String, fullName: dict.object(forKey: "fullName") as! String, address: dict.object(forKey: "address") as! String, phone: dict.object(forKey: "phone") as! String, dateOfBirth: dict.object(forKey: "dateOfBirth") as! Date, gender: dict.object(forKey: "gender") as! Bool)
            contacts.append(contact)
        }
        return contacts
    }

    // MARK: - Private function
    func getFileDocumentPath(fileName: String, type: String) -> String {
        return (Bundle.main.path(forResource: fileName, ofType: type)) ?? ""
    }
}
