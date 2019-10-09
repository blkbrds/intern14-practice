//
//  Ex4ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex4ViewController: BaseViewController {
    
    var exercise: Exercise?
    var listContacts: [[String]] = [[]]
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = exercise?.name
        configTableView()
    }
    
    override func setupData() {
       let contacts = DataManagement.share.loadDataTypeString(fileName: "contacts", type: "plist")
        let skypes = DataManagement.share.loadDataTypeString(fileName: "skypes", type: "plist")
        listContacts[0] = contacts
        listContacts.append(skypes)
    }
    
    func configTableView () {
        //register table
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension Ex4ViewController: UITableViewDataSource, UITableViewDelegate {
    // amount of section in table
    func numberOfSections(in tableView: UITableView) -> Int {
        return listContacts.count
    }

    //amount of rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listContacts[section].count
    }

    //constructor and change return value in cell of table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = "\(listContacts[indexPath.section][indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Contacts"
        default:
            return "Skypes"
        }
    }
}
