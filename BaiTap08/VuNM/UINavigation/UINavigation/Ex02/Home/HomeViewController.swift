//
//  HomeViewController.swift
//  DemoNavi
//
//  Created by PCI0007 on 7/10/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeMessegeLabel: UILabel!
    let login = LoginViewController()
    let edit = EditViewController()
    var user = "Vu"
    var isFirsRun = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let text = UserDefaults.standard.string(forKey: "id") else { return }
        homeMessegeLabel.text = "Hello \(text)"
        setButton()
    }
    
    func setButton() {
        let logout = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(logoutButton))
        let edit = UIBarButtonItem(title: "Edit", style: .plain	, target: self, action: #selector(editButton))
        navigationItem.leftBarButtonItem = logout
        navigationItem.rightBarButtonItem = edit
    }
    
    @objc func logoutButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func editButton() {
        navigationController?.pushViewController(edit, animated: true)
        if isFirsRun {
            isFirsRun = false
        } else {
            edit.messegeLabel2.text = ""
        }
    }
}
