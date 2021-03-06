//
//  Ex3ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex3ViewController: BaseViewController {

    @IBOutlet weak var mienLabel: UILabel!
    @IBOutlet weak var tinhLabel: UILabel!
    @IBOutlet weak var huyenLabel: UILabel!

    // MARK: - Properties
    var exercise: Exercise?

    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(getNotification(_:)), name: NSNotification.Name("REGIONNOTIFICATION"), object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("REGIONNOTIFICATION"), object: nil)
    }

    // MARK: - Config
    override func setupUI() {
        super.setupUI()
        self.title = exercise?.name
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonClicked))
        navigationItem.rightBarButtonItem = editButton
    }

    override func setupData() {
        super.setupData()
    }

    @objc func editButtonClicked() {
        let mienVC = MienViewController()
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
