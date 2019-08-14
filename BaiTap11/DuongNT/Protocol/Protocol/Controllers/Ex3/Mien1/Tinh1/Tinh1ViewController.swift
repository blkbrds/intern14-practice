//
//  Tinh1ViewController.swift
//  Protocol
//
//  Created by Nguyen Duong on 8/12/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

class Tinh1ViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties
    var mien: Mien?
    var tinh: Tinh?
    var huyenList: [Huyen] = []

    // MARK: - Config
    override func setupUI() {
        super.setupUI()
        self.title = tinh?.name
        tableView.register(UINib(nibName: "MienCell", bundle: nil), forCellReuseIdentifier: "cell")
    }

    override func setupData() {
        super.setupData()
        if let tinh = tinh {
            huyenList = tinh.huyen
        }
    }
}

extension Tinh1ViewController: UITableViewDelegate, UITableViewDataSource {

    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return huyenList.count
        
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? MienCell
        let huyen = huyenList[indexPath.row]
        cell?.nameLabel.text = huyen.name
        return cell!
    }

    // MARK: - Table view delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            var dict: Dictionary<String, AnyObject> = Dictionary()
            dict.updateValue(self.huyenList[indexPath.row].name as AnyObject, forKey: "huyen")
            dict.updateValue(self.tinh?.name as AnyObject, forKey: "tinh")
            dict.updateValue(self.mien?.name as AnyObject, forKey: "mien")
            NotificationCenter.default.post(name: NSNotification.Name("REGIONNOTIFICATION"), object: nil, userInfo: dict)
            for controller in self.navigationController!.viewControllers as Array {
                if controller.isKind(of: Ex3ViewController.self) {
                    self.navigationController!.popToViewController(controller, animated: true)
                    break
                }
            }
        case 1:
            var dict: Dictionary<String, AnyObject> = Dictionary()
            dict.updateValue(self.huyenList[indexPath.row].name as AnyObject, forKey: "huyen")
            dict.updateValue(self.tinh?.name as AnyObject, forKey: "tinh")
            dict.updateValue(self.mien?.name as AnyObject, forKey: "mien")
            NotificationCenter.default.post(name: NSNotification.Name("REGIONNOTIFICATION"), object: nil, userInfo: dict)
            for controller in self.navigationController!.viewControllers as Array {
                if controller.isKind(of: Ex3ViewController.self) {
                    self.navigationController!.popToViewController(controller, animated: true)
                    break
                }
            }
        case 2:
            var dict: Dictionary<String, AnyObject> = Dictionary()
            dict.updateValue(self.huyenList[indexPath.row].name as AnyObject, forKey: "huyen")
            dict.updateValue(self.tinh?.name as AnyObject, forKey: "tinh")
            dict.updateValue(self.mien?.name as AnyObject, forKey: "mien")
            NotificationCenter.default.post(name: NSNotification.Name("REGIONNOTIFICATION"), object: nil, userInfo: dict)
            for controller in self.navigationController!.viewControllers as Array {
                if controller.isKind(of: Ex3ViewController.self) {
                    self.navigationController!.popToViewController(controller, animated: true)
                    break
                }
            }
        default:
            // create the alert
            let alert = UIAlertController(title: "Warning",
                                          message: "Please, create new View Controller.",
                                          preferredStyle: UIAlertController.Style.alert)
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
    }
}
