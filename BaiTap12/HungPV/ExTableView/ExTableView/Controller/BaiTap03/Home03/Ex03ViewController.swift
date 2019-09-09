//
//  Ex03ViewController.swift
//  ExTableView
//
//  Created by PCI0010 on 9/5/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class Ex03ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var names = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = " Ex03 "
        navigationController?.navigationBar.backgroundColor = .cyan
        names = DataManagement.share.getNameAcc(fileName: "Ex02", type: "plist")
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "ex03")
    }
}

extension Ex03ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ex03") as? CustomCell else { return UITableViewCell() }
        cell.nameLabel.text = names[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = Detail03ViewController()
        vc.textName = names[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
