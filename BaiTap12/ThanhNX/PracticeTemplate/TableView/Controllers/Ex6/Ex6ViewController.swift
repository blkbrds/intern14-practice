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
    var ex6AmericaCells: [ExName] = []
    var ex6ChinaCells: [ExName] = []
    var ex6FranceCells: [ExName] = []
    var ex6Sections: [[ExName]] = []
    var ex6SectionIndex: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = "Ex6"
        
        tableView.register(UINib(nibName: "ExCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    override func setupData() {
        ex6AmericaCells = DataManagement.share.getName(fileName: "ex2", type: "plist")
        ex6ChinaCells = DataManagement.share.getName(fileName: "ex6China", type: "plist")
        ex6FranceCells = DataManagement.share.getName(fileName: "ex6France", type: "plist")
        ex6Sections = [ex6AmericaCells, ex6ChinaCells, ex6FranceCells]
        ex6SectionIndex = ["A", "C", "F"]
    }
}

extension Ex6ViewController: UITableViewDelegate, UITableViewDataSource {
    //TableView DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return ex6Sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return ex6AmericaCells.count
        case 1:
            return ex6ChinaCells.count
        case 2:
            return ex6FranceCells.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ExCell else { return UITableViewCell() }
        let name = ex6Sections[indexPath.section][indexPath.row]
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
        return ex6SectionIndex
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
}
