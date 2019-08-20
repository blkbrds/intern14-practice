//
//  Ex9ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex9ViewController: BaseViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    //MARK: Propeties
    var americaCells: [ExName] = []
    var chinaCells: [ExName] = []
    var franceCells: [ExName] = []
    var ex9Sections: [[ExName]] = []
    var sectionIndex: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = "Ex9"
        
        tableView.register(UINib(nibName: "HomeCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    override func setupData() {
        americaCells = DataManagement.share.getName(fileName: "ex2", type: "plist")
        chinaCells = DataManagement.share.getName(fileName: "ex6China", type: "plist")
        franceCells = DataManagement.share.getName(fileName: "ex6France", type: "plist")
        ex9Sections = [americaCells, chinaCells, franceCells]
        sectionIndex = ["A", "C", "F"]
    }
}

extension Ex9ViewController: UITableViewDelegate, UITableViewDataSource {
    //MARK: TableView DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return ex9Sections.count
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
        case 0: return americaCells.count
        case 1: return chinaCells.count
        case 2: return franceCells.count
        default: return 0
        }
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionIndex
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? HomeCell else { return UITableViewCell() }
        let name = ex9Sections[indexPath.section][indexPath.row]
        cell.imageCell.image = #imageLiteral(resourceName: "ic-president")
        cell.titleLabel.text = name.name
        cell.subTitleLabel.text = "President"
        cell.delegate = self
        return cell
    }
}

//MARK: HomeCell Delegate
extension Ex9ViewController: HomeCellDelegate {
    func homeCellView(_ viewCell: HomeCell) {
        var presidentName = ""
        if let name = viewCell.titleLabel.text {
            presidentName = name
        }
        print("Home Cell ---> Tap Me: \(presidentName)")
    }
}
