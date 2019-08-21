//
//  Ex10ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex10ViewController: BaseViewController {
    //MARK: Outlet
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    
    //MARK: Propeties
    private var president: [String] = []
    private var sections: [(key: String, value: [String])] = []
    private var filterData: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        president = DataManagement.share.getPresident(fileName: "ex2", type: "plist")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        filterData = president
        groupedCharacter(array: filterData)
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = "Ex10"
        
        tableView.register(UINib(nibName: "NameUserCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    private func groupedCharacter(array: [String]) {
        let groupedDic = Dictionary(grouping: array, by: {String($0.prefix(1))})
        sections = groupedDic.sorted { $0.0 < $1.0 }
    }
}

extension Ex10ViewController: UITableViewDelegate, UITableViewDataSource {
    //MARK: TableView DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? NameUserCell else { return UITableViewCell() }
        let section = sections[indexPath.section]
        let value = section.value
        let key = value[indexPath.row]
        cell.nameLabel.text = key
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].key
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sections.map { $0.key }
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
}

//MARK: SearchBar Delegate
extension Ex10ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterData = president.filter({ (text: String) -> Bool in
            return text.lowercased().contains(searchText.lowercased())
        })
        if searchBar.text == "" {
            groupedCharacter(array: president)
        } else {
            groupedCharacter(array: filterData)
        }
        tableView.reloadData()
    }
}
