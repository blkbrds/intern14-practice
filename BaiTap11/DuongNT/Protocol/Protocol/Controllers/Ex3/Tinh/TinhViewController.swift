//
//  Mien1ViewController.swift
//  Protocol
//
//  Created by Nguyen Duong on 8/12/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

class TinhViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    // MARK: - Properties
    var mien: Mien?
    var tinhList: [Tinh] = []

    // MARK: - Config
    override func setupUI() {
        super.setupUI()
        self.title = mien?.name
        tableView.register(UINib(nibName: "MienCell", bundle: nil), forCellReuseIdentifier: "cell")
    }

    override func setupData() {
        super.setupData()
        if let mien = mien {
            tinhList = mien.tinh
        }
    }
}

extension TinhViewController: UITableViewDelegate, UITableViewDataSource {

    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tinhList.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? MienCell
        let tinh = tinhList[indexPath.row]
        cell?.nameLabel.text = tinh.name
        return cell!
    }

    // MARK: - Table view delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = HuyenViewController()
        vc.mien = mien
        vc.tinh = self.tinhList[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
