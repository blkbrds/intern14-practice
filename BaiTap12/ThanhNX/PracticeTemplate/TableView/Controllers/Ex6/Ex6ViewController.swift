//
//  Ex6ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex6ViewController: BaseViewController {
    @IBOutlet private weak var tableView: UITableView!
    var americaCells: [UserName] = []
    var chinaCells: [UserName] = []
    var franceCells: [UserName] = []
    var sections: [[UserName]] = []
    var sectionIndex: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = "Ex6"
        sections.count
        sections[1].count
        
        tableView.register(UINib(nibName: "NameUserCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    override func setupData() {
        americaCells = DataManagement.share.getName(fileName: "ex2", type: "plist")
        chinaCells = DataManagement.share.getName(fileName: "ex6China", type: "plist")
        franceCells = DataManagement.share.getName(fileName: "ex6France", type: "plist")
        sections = [americaCells, chinaCells, franceCells]
        sectionIndex = ["A", "C", "F"]
    }
}

extension Ex6ViewController: UITableViewDelegate, UITableViewDataSource {
    //TableView DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return americaCells.count
        case 1: return chinaCells.count
        case 2: return franceCells.count
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? NameUserCell else { return UITableViewCell() }
        let name = sections[indexPath.section][indexPath.row]
        cell.nameLabel.text = name.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "America"
        case 1:
            return "China"
        case 2:
            return "France"
        default:
            return ""
        }
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionIndex
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
}
