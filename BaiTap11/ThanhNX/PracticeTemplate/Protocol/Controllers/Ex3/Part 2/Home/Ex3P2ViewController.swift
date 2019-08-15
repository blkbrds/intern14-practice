//
//  Ex3P2ViewController.swift
//  Protocol
//
//  Created by PCI0008 on 8/14/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

let myNotificationKey = "NOTIFICATIONKEY"

class Ex3P2ViewController: BaseViewController {
    @IBOutlet private weak var mienLabel: UILabel!
    @IBOutlet private weak var tinhLabel: UILabel!
    @IBOutlet private weak var huyenLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(getNotification(_:)), name: NSNotification.Name(myNotificationKey), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(myNotificationKey), object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = "Home"
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonClicked))
        navigationItem.rightBarButtonItem = editButton
    }
    
    @objc func editButtonClicked() {
        let mienVC = MienP2ViewController()
        mienVC.title = "Miền"
        navigationController?.pushViewController(mienVC, animated: true)
    }
    
    @objc func getNotification(_ notification: Notification) {
        let userInfor = notification.userInfo as! Dictionary<String, AnyObject>
        if let huyen = userInfor["huyen"] as? String, let tinh = userInfor["tinh"] as? String, let mien = userInfor["mien"] as? String {
            mienLabel.text = mien
            tinhLabel.text = tinh
            huyenLabel.text = huyen
        }
    }
}
