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
    @IBOutlet weak var tableView: UITableView!
    var ex4Cells: [ExName] = []
    var ex4Sections: [[ExName]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = "Ex4"
        
        tableView.register(UINib(nibName: "ExCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    override func setupData() {
        ex4Cells = DataManagement.share.getName(fileName: "ex2", type: "plist")
        for _ in 0..<3 {
            ex4Sections.append(ex4Cells)
        }
    }
}

extension Ex4ViewController: UITableViewDataSource, UITableViewDelegate {
    //MARK: TableView DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return ex4Sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ex4Cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ExCell else { return UITableViewCell() }
        let president = ex4Sections[indexPath.section][indexPath.row]
        cell.nameLabel.text = president.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section + 1)"
    }
}
