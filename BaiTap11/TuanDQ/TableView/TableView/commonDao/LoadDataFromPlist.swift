//
//  LoadDataFromPlist.swift
//  TableView
//
//  Created by MBA0051 on 10/16/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit
// Get contacts in phone
import Contacts
import ContactsUI

protocol LoadDataFromPlistDelegate: class {
    func loadArrayFromPlist(plistName: String) -> [String]
    func loadGroupArrayFromPlist(plistName: String) -> [[String]]
}

class LoadDataFromPlist {

//    weak var delegate: LoadDataFromPlistDelegate?
    static let share = LoadDataFromPlist()
    private let ext = "plist"
    private var myContact: [Contact] = [Contact]()

    private init() {
    }
    
    func loadArrayFromPlist(plistName: String) -> [String] {
        let emptyArray: [String] = []
        guard let path = Bundle.main.url(forResource: plistName, withExtension: ext) else { return emptyArray }
        guard let userData = NSArray(contentsOf: path) as? [String] else { return emptyArray }
        return userData
    }
    
    func loadGroupArrayFromPlist(plistName: String) -> [[String]] {
        var groupArray: [[String]] = [[]]
        guard let path = Bundle.main.url(forResource: plistName, withExtension: ext) else { return groupArray }
        guard let animalsPlist = NSArray(contentsOf: path) as? [Any]  else { return groupArray }
        
        for index in 0..<animalsPlist.count {
            guard let myArray = animalsPlist[index] as? [String] else { return groupArray }
            groupArray.append(myArray)
        }
        groupArray.remove(at: 0)
        return groupArray
    }
    
    func loadDefaultAnimalIndex() -> [String] {
        var animalsIndex: [String] = []
        // Create animal index
        animalsIndex.append("Home")
        animalsIndex.append("Reptiles")
        animalsIndex.append("Pantheras")
        animalsIndex.append("Herbivores")
        return animalsIndex
    }
    
    func getContactFromCNContact() -> [CNContact] {
        let store = CNContactStore()
        store.requestAccess(for: .contacts) { (granted, err) in
            if let err = err {
                print("Fail to request access", err)
                return
            }
            
            if granted {
                let keys = [CNContactGivenNameKey, CNContactPhoneNumbersKey, CNContactEmailAddressesKey]
                let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
                
                do {
                    try store.enumerateContacts(with: request, usingBlock: {(contact, stopPoiterIfYouWantToStopEnumerating) in
                        print(contact.givenName)
                        print(contact.phoneNumbers.first?.value ?? "")
                        print(contact.emailAddresses.first?.value ?? "")
                    })
                } catch let err {
                    print("Fail to enum contact:", err)
                }
                
                
                
                
            } else {
                print("Access deny")
            }
            
            
        }
        return []
    }
}
