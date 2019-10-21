//
//  Ex1ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex1ViewController: BaseViewController {
    
    var exercise: Exercise?
    var contacts: [String] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func configTableView () {
        //register table
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = exercise?.name
        configTableView()
    }

    override func setupData() {
        contacts = DataManagement.share.loadDataTypeString(fileName: "contacts", type: "plist")
    }
}

extension Ex1ViewController: UITableViewDataSource, UITableViewDelegate {
    // amount of section in table
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    //amount of rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }

    //constructor and change return value in cell of table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = "\(contacts[indexPath.row])"
        return cell
    }
    
    //event click cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contactsDetailVIewController = Ex03ViewController()
        contactsDetailVIewController.name = contacts[indexPath.row]
        navigationController?.pushViewController(contactsDetailVIewController, animated: true)
    }
}
