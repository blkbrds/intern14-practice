//
//  UserDetailViewController.swift
//  DemoNavi
//
//  Created by PCI0007 on 7/18/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    let path = HandlePlist.shared.plistInDocument
    lazy var arr = NSArray(contentsOfFile: path) as? [[String: String]]
    lazy var user = UserNameAndAvatar.parseDataOfNameAndAvatar(arr ?? [])
    var image = UIImage(named: "")

    @IBOutlet weak var userAvatarUIImageView: UIImageView!
    @IBOutlet weak var renameUITextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        getDetail()
    }
    
    func getDetail() {
        for i in 0..<user.count {
            if i == UserDefaults.standard.integer(forKey: "tag") {
                let image = UIImage(named: "avatar\(i)")
                userAvatarUIImageView.image = image
                renameUITextField.placeholder = "User\(i)"
            }
        }
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonAction))
        navigationItem.leftBarButtonItem = doneButton
    }
    
    @objc func doneButtonAction() {
        for i in 0..<user.count {
            if i == UserDefaults.standard.integer(forKey: "tag") {
                arr?[i]["name"] = renameUITextField.text ?? user[i].name
                let arr2 = arr as NSArray?
                arr2?.write(toFile: path, atomically: true)
                navigationController?.popViewController(animated: true)
                print(user[2])
                return
            }
 
        }
    }
}
