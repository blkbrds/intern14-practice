//
//  Ex03ViewController.swift
//  ExProtocol
//
//  Created by PCI0010 on 9/4/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class Ex03ViewController: UIViewController {
    
    @IBOutlet weak var mienLabel: UILabel!
    @IBOutlet weak var tinhLabel: UILabel!
    @IBOutlet weak var huyenLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        NotificationCenter.default.addObserver(self, selector: #selector(getNotification), name: .getNotificationName, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .getNotificationName, object: nil)
    }
    
    func configUI() {
        title = " Địa Điểm "
        navigationController?.navigationBar.backgroundColor = .cyan
        let editBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editDidClick))
        navigationItem.rightBarButtonItem = editBarButtonItem
    }
    
    @objc func getNotification(_ notification: Notification) {
        let userInfos = notification.userInfo as! Dictionary<String, AnyObject>
        if let huyen = userInfos["huyen"], let tinh = userInfos["tinh"], let mien = userInfos["mien"] {
            mienLabel.text = mien as? String
            tinhLabel.text = tinh as? String
            huyenLabel.text = huyen as? String
        }
    }
    
    @objc func editDidClick() {
        navigationController?.pushViewController(MienViewController(), animated: true)
    }
}

extension NSNotification.Name {
    static let getNotificationName = Notification.Name(rawValue: "hung")
}
