//
//  SearchUsersViewController.swift
//  TableView
//
//  Created by MBA0051 on 10/16/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class SearchUsersViewController: UIViewController {

    @IBOutlet weak var usersTableView: UITableView!
    @IBOutlet weak var userSearchBar: UISearchBar!
    var originUsers: [String] = []
    var searchUser: [String] = []
    let fileName = "userData"
    let ext = "plist"
    let myIdentity = "searchUser"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadDataFromPlist()
        configTableView()
    }
    
    private func loadDataFromPlist() {
        guard let path = Bundle.main.url(forResource: fileName, withExtension: ext) else { return }
        guard let userData = NSArray(contentsOf: path) as? [String] else { return }
        originUsers = userData
    }
    
    private func configTableView() {
        usersTableView.register(UITableViewCell.self, forCellReuseIdentifier: myIdentity)
        usersTableView.dataSource = self
        userSearchBar.delegate = self
    }
}

extension SearchUsersViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return originUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: myIdentity, for: indexPath)
        cell.textLabel?.text = originUsers[indexPath.row]
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}

extension SearchUsersViewController: UISearchBarDelegate {
    
}
