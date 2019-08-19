//
//  EditViewController.swift
//  ExNavigation
//
//  Created by PCI0010 on 8/8/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

protocol EditViewControllerDelegate: class {
    func didEditedUser(user: UserInfo)
    func didSavedData(path: String)
}

class EditViewController: UIViewController {
    
    //Mark: - IBOutlet
    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var pwText: UITextField!
    
    var userName: String = ""
    var passWord: String = ""
    var data: [UserInfo] = []
    
    var oldUser: UserInfo?
    weak var delegate: EditViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNaviBar()
        fetchData()
    }
    
    //Mark: - Functions
    func configNaviBar() {
        title = "Edit"
        navigationController?.navigationBar.backgroundColor = .purple
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(cancelButtonDidClick))
        navigationItem.leftBarButtonItem = cancelButton
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonDidClick))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    func alert1() {
        let alert = UIAlertController(title: "Error ", message: "New password cannot match the old password", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancel)
        present(alert, animated: true)
        pwText.text = ""
    }
    
    func alert2() {
        let alert = UIAlertController(title: "Error ", message: "Wrong Username", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancel)
        present(alert, animated: true)
        userText.text = ""
        pwText.text = ""
    }
    
    func doneEdit() {
        guard let userName = userText.text, let passWord = pwText.text else { return }
        // remove olduser
        for index in 0..<data.count {
            if data[index].username == oldUser?.username && data[index].password == oldUser?.password {
                data.remove(at: index)
                break
            }
        }
        let newUser = UserInfo(username: userName, password: passWord)
        data.append(newUser)
        let rootPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, .userDomainMask, true)[0]
        let path = rootPath.appendingFormat("/users.plist")
        do {
            var array = [[String:String]]()
            for item in data {
                var new = [String: String]()
                new["username"] = item.username
                new["password"] = item.password
                array.append(new)
            }
            let data = try PropertyListSerialization.data(fromPropertyList: array, format: .binary, options: 0)
            try data.write(to: URL(fileURLWithPath: path))
            if let delegate = delegate {
                delegate.didSavedData(path: path)
            }
        } catch {
            print(error)
        }
        if let delegate = delegate {
            delegate.didEditedUser(user: newUser)
        }
        navigationController?.popViewController(animated: true)
    }
    
    func fetchData() {
        let data = DataManagement.share.getListUserInfo(fileName: "users", type: "plist")
        self.data = data
    }
    
    @objc func cancelButtonDidClick() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func doneButtonDidClick() {
        doneEdit()
    }
}

