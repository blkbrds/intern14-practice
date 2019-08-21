//
//  Ex3ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex3ViewController: BaseViewController {
    //MARK: Outlet
    @IBOutlet private weak var tableView: UITableView!
    
    var names: [UserName] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = "HOME"
        
        tableView.register(UINib(nibName: "NameUserCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    override func setupData() {
        names = DataManagement.share.getName(fileName: "ex2", type: "plist")
    }
}

extension Ex3ViewController: UITableViewDelegate, UITableViewDataSource {
    //MARK: tableView DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? NameUserCell else { return UITableViewCell() }
        let president = names[indexPath.row]
        cell.nameLabel.text = president.name
        
        return cell
    }
    
    //MARK: TableView Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = PresidentViewController()
        vc.name = self.names[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
