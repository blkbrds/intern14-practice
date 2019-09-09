//
//  Ex10ViewController.swift
//  ExTableView
//
//  Created by PCI0010 on 9/6/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class Ex10ViewController: UIViewController {
    
    var names = [String]()
    var searchedName = [String]()
    var nameGrouped = [(key: String,value: [String])]()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = " Ex10 "
        navigationController?.navigationBar.backgroundColor = .cyan
        configData()
        self.tableView.reloadData()
    }
    
    func getNameGrouped(arr: [String]){
        let groupDic = Dictionary(grouping: arr, by: {String($0.prefix(1))})
        nameGrouped = groupDic.sorted {$0.0 < $1.0}
    }
    
    func configData() {
        names = DataManagement.share.getNameAcc(fileName: "Ex02", type: "plist")
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "ex10")
        searchedName = names
        getNameGrouped(arr: searchedName)
    }
    
}
extension Ex10ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return nameGrouped.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nameGrouped[section].key
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.nameGrouped[section].value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ex10") as? CustomCell else { return UITableViewCell() }
        cell.subNameLabel.isHidden = true
        let section = nameGrouped[indexPath.section]
        let value = section.value
        cell.nameLabel.text = value[indexPath.row]
        return cell }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return nameGrouped.map { $0.key }
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
}

extension Ex10ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedName = searchText.isEmpty ? names : names.filter({(dataString: String) -> Bool in
            return dataString.range(of: searchText, options: .caseInsensitive) != nil
        })
        if searchBar.text == "" {
            getNameGrouped(arr: names)
        } else {
            getNameGrouped(arr: searchedName)
        }
        
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        getNameGrouped(arr: names)
        self.tableView.reloadData()
    }
    
}

