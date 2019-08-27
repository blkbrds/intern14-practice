//
//  Ex4ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex4ViewController: BaseViewController {
    //MARK: Outlet
    @IBOutlet private weak var tableView: UITableView!
    var names: [UserName] = []
    var sections: [[UserName]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = "Ex4"
        
        tableView.register(UINib(nibName: "NameUserCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    override func setupData() {
        names = DataManagement.share.getName(fileName: "ex2", type: "plist")
        for _ in 0..<3 {
            sections.append(names)
        }
    }
}

extension Ex4ViewController: UITableViewDataSource, UITableViewDelegate {
    //MARK: TableView DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? NameUserCell else { return UITableViewCell() }
        let president = sections[indexPath.section][indexPath.row]
        cell.nameLabel.text = president.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section + 1)"
    }
}
