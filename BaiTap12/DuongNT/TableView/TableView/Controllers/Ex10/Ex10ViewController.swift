//
//  Ex10ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex10ViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - Properties
    var exercise: Exercise?
    private var contacts: [String] = []
    private var sections: [String: [String]] = [:]
    private var filtered: [String] = []
    private var searchActive : Bool = false

    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Config
    override func setupUI() {
        super.setupUI()
        self.title = exercise?.name
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
    }

    override func setupData() {
        super.setupData()
        contacts = DataManagement.share.getContacts(fileName: "nameList", type: "plist")
        groupedCharacter(list: contacts)
    }

    // MARK: - Custom func
    private func groupedCharacter(list: [String]) {
        // Group list name has the same first character
        let groupedDictionary = Dictionary(grouping: list, by: {String($0.prefix(1))})
        // get the keys and sort them
        let keys = groupedDictionary.keys.sorted()
        // map the sorted keys to a struct
        for index in 0..<keys.count {
            sections[keys[index]] = groupedDictionary[keys[index]]!.sorted()
        }
//        sections = keys.map {
//            Section(character: $0, names: groupedDictionary[$0]!.sorted())
//        }
        tableView.reloadData()
    }
}
//
//extension Ex10ViewController {
//    struct Section {
//        let character : String
//        let names : [String]
//    }
//}

extension Ex10ViewController: UISearchBarDelegate {

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }

    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filtered = contacts.filter({( str : String) -> Bool in
            return str.lowercased().contains(searchText.lowercased())
        })
        if filtered.count == 0 {
            searchActive = false
        } else {
            searchActive = true
        }
        if searchActive {
            groupedCharacter(list: filtered)
        } else {
            groupedCharacter(list: contacts)
        }
        tableView.reloadData()
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterContentForSearchText(searchText)
    }
}

extension Ex10ViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var keys: [String] = Array(sections.keys)
        return sections[keys[section]]!.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let keys: [String] = Array(sections.keys)
        let contact = sections[keys[indexPath.section]]?[indexPath.row]
        cell.textLabel?.text = contact
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var keys: [String] = Array(sections.keys)
        return keys[section]
    }

    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return Array(sections.keys)
    }

    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
}
