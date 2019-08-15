//
//  TinhP2ViewController.swift
//  Protocol
//
//  Created by PCI0008 on 8/14/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

class TinhP2ViewController: BaseViewController {
    
    @IBOutlet private weak var tinhTableView: UITableView!
    
    var mien: Mien?
    var tinhs: [Tinh] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tinhTableView.delegate = self
        tinhTableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = "Tinh"
        
        tinhTableView.register(UINib(nibName: "MienCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    override func setupData() {
        super.setupData()
        guard let mien = mien else { return }
        tinhs = mien.tinh
        tinhTableView.reloadData()
    }
}

//MARK: TableView DataSource
extension TinhP2ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tinhs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? MienCell else { return UITableViewCell() }
        let tinh = tinhs[indexPath.row]
        cell.nameLabel.text = tinh.name
        return cell
    }
}

//MARK: TableView Delegate
extension TinhP2ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let huyenVC = HuyenP2ViewController()
        huyenVC.mien = mien
        huyenVC.tinh = self.tinhs[indexPath.row]
        self.navigationController?.pushViewController(huyenVC, animated: true)
    }
}
