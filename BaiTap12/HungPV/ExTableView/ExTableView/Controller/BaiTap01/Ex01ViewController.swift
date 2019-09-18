//
//  Ex01ViewController.swift
//  ExTableView
//
//  Created by PCI0010 on 9/5/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class Ex01ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "ex01")
    }
    
    func configUI() {
        title = "Ex01"
        navigationController?.navigationBar.backgroundColor = .cyan
    }
}

extension Ex01ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ex01") as? CustomCell else { return UITableViewCell() }
        cell.nameLabel.text = "Row \(indexPath.row + 1)"
        return cell
    }
}
