//
//  MienViewController.swift
//  Protocol
//
//  Created by Nguyen Duong on 8/12/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

class MienViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!

    private var miens: [Mien] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        loadData()
    }
    
    private func setUpUI() {
        tableView.register(UINib(nibName: "MienCell", bundle: nil), forCellReuseIdentifier: "cell")
    }

    private func loadData() {
        miens = DataManagement.share.getMiens(fileName: "miens", type: "plist")
    }
}

extension MienViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return miens.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? MienCell
        let mien = miens[indexPath.row]
        cell?.nameLabel.text = mien.name
        return cell!
    }

    // MARK: - Table view delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            let vc = Mien1ViewController()
            vc.mien = self.miens[indexPath.row]
            vc.tinhList = self.miens[indexPath.row].tinh
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = Mien2ViewController()
            vc.mien = self.miens[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
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
