//
//  MienViewController.swift
//  ExProtocol
//
//  Created by PCI0010 on 9/4/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class MienViewController: UIViewController {
    
    var newMien: [Mien] = Mien.datas()
    
    @IBOutlet weak var mienTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    func configUI() {
        title = " Miền "
        navigationController?.navigationBar.backgroundColor = .cyan
        mienTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "MyCell")
    }
}

extension MienViewController: UITableViewDelegate, UITableViewDataSource {
    
    //Mark: - DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newMien.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as? CustomTableViewCell else { return UITableViewCell() }
        let mien = newMien[indexPath.row]
        cell.nameLabel.text = mien.name
        return cell
    }
    
    //Mark: - Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = TinhViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        vc.mien = self.newMien[indexPath.row]
    }
    
}
