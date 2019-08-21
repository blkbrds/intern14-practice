//
//  AlertsVC.swift
//  ContactList
//
//  Created by Nguyen Duong on 8/19/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class AlertsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func alertSettings(title: String, message: String, actions: [UIAlertAction]) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)

        for action in actions {
            alert.addAction(action)
        }
        self.present(alert, animated: true)
    }

    func saveImageDocumentDirectory(avatarImageView: UIImageView) {
        let fileManager = FileManager.default
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("apple.jpg")
        print(paths)
        let imageData = UIImage.pngData(avatarImageView.image!)
        fileManager.createFile(atPath: paths, contents: imageData(), attributes: nil)
    }

    func getDirectoryPath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }

    func getImage() -> [String] {
        let fileManager = FileManager.default
        let imagePAth = (self.getDirectoryPath() as NSString).appendingPathComponent("/apple.jpg")
        if fileManager.fileExists(atPath: imagePAth) {
            return ["apple.jpg",imagePAth]
        } else {
            return []
        }
    }
}
