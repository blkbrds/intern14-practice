//
//  BaseViewController.swift
//  TabBarController
//
//  Created by Nguyen Duong on 8/22/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var users: [User] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        loadFilePlist()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    private func loadFilePlist() {
        let isFistLoad = UserDefaults.standard.bool(forKey: "firstLoad")
        if !isFistLoad {
            FileManagers.copyFilesFromBundleToDocumentsFolderWith(fileExtension: "plist")
            UserDefaults.standard.set(true, forKey: "firstLoad")
        }
        users = User.parseData(array: FileManagers.readPlist(namePlist: "users"))
    }

    func alertSettings(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}
