//
//  Ex02ViewController.swift
//  ExTableView
//
//  Created by PCI0010 on 9/5/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class Ex02ViewController: UIViewController {
    
    var names = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = " Ex02 "
        navigationController?.navigationBar.backgroundColor = .cyan
        names = DataManagement.share.getNameAcc(fileName: "Ex02", type: "plist")
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "ex02")
    }
    
}

extension Ex02ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ex02") as? CustomCell else { return UITableViewCell() }
        cell.nameLabel.text = names[indexPath.row]
        return cell
    }
}
