//
//  HuyenViewController.swift
//  ExProtocol
//
//  Created by PCI0010 on 9/4/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class HuyenViewController: UIViewController {
    
    var mien: Mien?
    var tinh: Tinh?
    var newHuyen: [Huyen] = []
    
    @IBOutlet weak var huyenTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        huyenTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "mycell")
        guard let tinh = tinh else { return }
        self.newHuyen = tinh.huyen
    }
    
    func configUI() {
        title = " Huyện "
        navigationController?.navigationBar.backgroundColor = .cyan
    }
}

extension HuyenViewController: UITableViewDelegate, UITableViewDataSource {
    
    //Mark: - DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newHuyen.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "mycell") as? CustomTableViewCell else { return UITableViewCell() }
        let huyen = newHuyen[indexPath.row]
        cell.nameLabel.text = huyen.name
        return cell
    }
    
    //Mark: - Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        var dict: Dictionary<String, AnyObject> = Dictionary()
        dict.updateValue(self.newHuyen[indexPath.row].name as AnyObject , forKey: "huyen")
        dict.updateValue(self.tinh?.name as AnyObject, forKey: "tinh")
        dict.updateValue(self.mien?.name as AnyObject, forKey: "mien")
        NotificationCenter.default.post(name: NSNotification.Name("hung"), object: nil, userInfo: dict)
        guard let exVC = navigationController?.viewControllers.first(where: {$0 is Ex03ViewController}) else { return }
        navigationController?.popToViewController(exVC, animated: true)
    }
    
}
