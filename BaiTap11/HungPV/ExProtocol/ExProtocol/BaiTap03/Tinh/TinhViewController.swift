//
//  TinhViewController.swift
//  ExProtocol
//
//  Created by PCI0010 on 9/4/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class TinhViewController: UIViewController {
    
    var mien: Mien?
    var newTinh: [Tinh] = []
    
    @IBOutlet weak var tinhTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    func configUI() {
        title = " Tỉnh "
        navigationController?.navigationBar.backgroundColor = .cyan
        tinhTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "Mycell")
        guard let mien = mien else { return }
        self.newTinh = mien.tinh
    }
}

extension TinhViewController: UITableViewDataSource, UITableViewDelegate {
    
    //Mark: - DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newTinh.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Mycell") as? CustomTableViewCell else { return UITableViewCell() }
        let tinh = newTinh[indexPath.row]
        cell.nameLabel.text = tinh.name
        return cell
    }
    
    //Mark: - Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = HuyenViewController()
        vc.mien = self.mien
        vc.tinh = self.newTinh[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
