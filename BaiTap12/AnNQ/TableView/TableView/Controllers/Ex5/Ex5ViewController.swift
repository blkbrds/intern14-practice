//
//  Ex5ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex5ViewController: BaseViewController {
    
    var exercise: Exercise?
    var contacts: [String] = []
    var dataSearch: [String] = []
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        search(keyword: "")
        searchBar.text = ""
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = exercise?.name
        configTableView()
        configSearchBar()
    }
    
    override func setupData() {
       contacts = DataManagement.share.loadDataTypeString(fileName: "contacts", type: "plist")
    }
    
    func configTableView () {
        //register table
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func configSearchBar() {
        searchBar.delegate = self
        dataSearch = contacts
    }
    
    func search(keyword: String) {
        dataSearch = getContact(keyword: keyword)
        tableView.reloadData()
    }
    
    func getContact(keyword: String) -> [String] {
        if keyword.trimmingCharacters(in: CharacterSet(charactersIn: " ")) == "" {
            return contacts
        }
        
        var data: [String] = []
        for value in contacts {
            if let _ = value.range(of: keyword) {
                data.append(value)
            }
        }
        
        return data
    }
}

extension Ex5ViewController: UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    // amount of section in table
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    //amount of rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSearch.count
    }

    //constructor and change return value in cell of table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = "\(dataSearch[indexPath.row])"
        return cell
    }
    
    //event click cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contactsDetailVIewController = Ex03ViewController()
        contactsDetailVIewController.name =  dataSearch[indexPath.row]
        navigationController?.pushViewController(contactsDetailVIewController, animated: true)
    }
    
    
    //search bar delegate
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        var currentText = ""
        if let searchBarText = searchBar.text {
            currentText = searchBarText
        }
        
        let keyword = (currentText as NSString).replacingCharacters(in: range, with: text)
        search(keyword: keyword)
        return true
    }
}
