//
//  BusinessController.swift
//  PersonsManagement
//
//  Created by MBA0051 on 10/1/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class BusinessController {
    
    private static var users: [UserModel] = []
    private static var userDomain: [UserInfo] = []
    private static var personDomain: [PersonInfo] = []
    
    /**
     * Initial data.
     */
    public static func loadDataFromPlistFile(name plistName: String) {
        
        var user: UserModel
        clearOldData()
        
        // Load data from Plist to User model.
        if let pListPath = Bundle.main.path(forResource: plistName, ofType: "plist"), // get path
            let plistData = NSDictionary(contentsOfFile: pListPath) {    // Get list data.
            
            // Add object to list.
            for item in plistData.allKeys {
                let userRecord = plistData.object(forKey: item) as! Dictionary<String, String>
                user = UserModel(userId: item as! String, personImage: userRecord["avatar"]!, personName: userRecord["fullname"]!, username: userRecord["username"]!, password: userRecord["password"]!)
                users.append(user)
            }
        }

        /* Extract information to User domain and Person domain.(seperate information for particular target) */
        var personTag = 0
        for item in users {
            userDomain.append(UserInfo(userId: item.userId, username: item.username, password: item.password))
            personDomain.append(PersonInfo(userId: item.userId, personImage: UIImage(named: item.personImage)!, personName: item.personName, tag: personTag))
            personTag += 1
        }
    }
    
    private static func clearOldData() {
        users = []
        userDomain = []
        personDomain = []
    }
    /**
     * Check login information.
     */
    public static func checkLogin(username: String, password: String) -> (String?, String?) {
        
        guard validateUserAndPasswordFormat(username: username, password: password) else {
            return ("Username and password invalid format.", nil)
        }
        
        for user in userDomain {
            if user.username == username && user.password == password {
                return (nil, user.userId)
            }
        }
        return ("user or password incorrect.", nil)
    }
    
    /**
     * Get current user based on Standard user default.
     */
    public static func getCurrentUser() -> UserInfo? {
        let userId = UserDefaults.standard.object(forKey: CommonConstant.USERID) as! String
        for user in userDomain {
            if user.userId == userId {
                return user
            }
        }
        return nil
    }
    
    /**
     * Update user.
     */
    public static func updateUser(updateUser: UserInfo) -> Bool {
        for index in 0..<userDomain.count {
            if userDomain[index].userId == updateUser.userId {
                userDomain[index] = updateUser
                return true
            }
        }
        return false
    }
    
    /**
     * Get list person.
     */
    public static func getPersonsInfo() -> [PersonInfo] {
        return personDomain
    }
    
    /**
     * Get person information by ID
     */
    public static func getPersonById(id userId: String) -> PersonInfo? {
        for person in personDomain {
            if person.userId == userId {
                return person
            }
        }
        return nil
    }
    
    /**
     * Update person infor.
     */
    public static func updatePerson(person updatePerson: PersonInfo) -> Bool {
        for index in 0..<personDomain.count {
            if personDomain[index].userId == updatePerson.userId {
                personDomain[index] = updatePerson
                return true
            }
        }
        return false
    }
    
    /**
     * Validate format and character type.
     */
    private static func validateUserAndPasswordFormat(username: String, password: String) -> Bool {
        guard username.count <= 32 && username.count >= 6 else {
            return false
        }
        guard password.count <= 32 && password.count >= 6 else {
            return false
        }
        return true
    }
}
