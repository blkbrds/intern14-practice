//
//  Ex04ViewController.swift
//  ExTableView
//
//  Created by PCI0010 on 9/5/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class Ex04ViewController: UIViewController {
    
    var names = [String]()
    var nickName = [[String]]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Ex04"
        navigationController?.navigationBar.backgroundColor = .cyan
        names = DataManagement.share.getNameAcc(fileName: "Ex02", type: "plist")
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "ex04")
        for _ in 0..<5 {
            nickName.append(names)
        }
    }
}

extension Ex04ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return nickName.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ex04") as? CustomCell else { return UITableViewCell() }
        cell.nameLabel.text = nickName[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section + 1)"
    }
    
}
