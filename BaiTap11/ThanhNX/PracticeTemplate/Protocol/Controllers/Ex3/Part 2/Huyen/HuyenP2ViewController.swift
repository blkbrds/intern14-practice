//
//  HuyenP2ViewController.swift
//  Protocol
//
//  Created by PCI0008 on 8/14/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

class HuyenP2ViewController: BaseViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    var mien: Mien?
    var tinh: Tinh?
    var huyens: [Huyen] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = "Huyen"
        
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    override func setupData() {
        guard let tinh = tinh else { return }
        huyens = tinh.huyen
        tableView.reloadData()
    }
}

extension HuyenP2ViewController: UITableViewDataSource, UITableViewDelegate {
    //MARK: TableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return huyens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomCell else { return UITableViewCell() }
        let huyen = huyens[indexPath.row]
        cell.nameLabel.text = huyen.name
        return cell
    }
    
    //MARK: TableView Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        var value: Dictionary<String, AnyObject> = Dictionary()
        value.updateValue(self.huyens[indexPath.row].name as AnyObject, forKey: "huyen")
        guard let tinh = tinh, let mien = mien else { return }
        value.updateValue(tinh.name as AnyObject, forKey: "tinh")
        value.updateValue(mien.name as AnyObject, forKey: "mien")
        NotificationCenter.default.post(name: .myNotificationName, object: nil, userInfo: value)
        guard let homeVC = navigationController?.viewControllers.first(where: { $0 is Ex3P2ViewController }) else { return }
        navigationController?.popToViewController(homeVC, animated: true)
    }
}
