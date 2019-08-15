//
//  MienP2ViewController.swift
//  Protocol
//
//  Created by PCI0008 on 8/14/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

class MienP2ViewController: BaseViewController {
    @IBOutlet private weak var mienTabelView: UITableView!
    
    var miens: [Mien] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadDesign()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = "Mien"
        
        let tinhButton = UIBarButtonItem(title: "Miền", style: .done, target: self, action: #selector(mienButtonDidClick))
        navigationItem.rightBarButtonItem = tinhButton
        
        mienTabelView.register(UINib(nibName: "MienCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    private func loadDesign() {
        miens = Mien.Dummy.miens
    }
    
    override func setupData() {
        mienTabelView.reloadData()
    }
    
    @objc private func mienButtonDidClick() {
        let tinhVC = TinhP2ViewController()
        navigationController?.pushViewController(tinhVC, animated: true)
    }
}

//MARK: TableView DataSource
extension MienP2ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return miens.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? MienCell else {
            return UITableViewCell()
        }
        let mien = miens[indexPath.row]
        cell.nameLabel.text = mien.name
        return cell
    }
}

//MARK: TableView Delegate
extension MienP2ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let tinhVC = TinhP2ViewController()
        tinhVC.mien = self.miens[indexPath.row]
        self.navigationController?.pushViewController(tinhVC, animated: true)
    }
}
