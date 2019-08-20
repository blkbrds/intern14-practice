//
//  Ex7ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex7ViewController: BaseViewController {
    @IBOutlet private weak var tableView: UITableView!
    var ex7AmericaCells: [ExName] = []
    var ex7ChinaCells: [ExName] = []
    var ex7FranceCells: [ExName] = []
    var ex7Sections: [[ExName]] = []
    var ex7SectionIndex: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = "Ex7"
        
        tableView.register(UINib(nibName: "Ex7Cell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    override func setupData() {
        ex7AmericaCells = DataManagement.share.getName(fileName: "ex2", type: "plist")
        ex7ChinaCells = DataManagement.share.getName(fileName: "ex6China", type: "plist")
        ex7FranceCells = DataManagement.share.getName(fileName: "ex6France", type: "plist")
        ex7Sections = [ex7AmericaCells, ex7ChinaCells, ex7FranceCells]
        ex7SectionIndex = ["A", "C", "F"]
    }
}

extension Ex7ViewController: UITableViewDelegate, UITableViewDataSource {
    //MARK: TableView DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return ex7Sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "America"
        case 1: return "China"
        case 2: return "France"
        default: return ""
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return ex7AmericaCells.count
        case 1: return ex7ChinaCells.count
        case 2: return ex7FranceCells.count
        default: return 0
        }
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return ex7SectionIndex
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? Ex7Cell else { return UITableViewCell() }
        let name = ex7Sections[indexPath.section][indexPath.row]
        cell.nameLabel.text = name.name
        cell.positionLabel.text = "President"
        return cell
    }
}
