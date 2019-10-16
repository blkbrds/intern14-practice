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
        searchUser = originUsers
    }
    
    private func configTableView() {
        usersTableView.register(UITableViewCell.self, forCellReuseIdentifier: myIdentity)
        usersTableView.dataSource = self
        userSearchBar.delegate = self
    }
}

extension SearchUsersViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: myIdentity, for: indexPath)
        cell.textLabel?.text = searchUser[indexPath.row]
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    private func search(keyword: String) {
        searchUser = searchUserByKeyword(keyword: keyword)
        usersTableView.reloadData()
    }
    
    private func searchUserByKeyword(keyword: String) -> [String] {
        if keyword.trimmingCharacters(in: CharacterSet(charactersIn: " ")) == "" {
            return originUsers
        } else {
            var searchData: [String] = []
            for user in originUsers {
                if let _ = user.range(of: keyword) {
                    searchData.append(user)
                }
            }
            return searchData
        }
    }
}

extension SearchUsersViewController: UISearchBarDelegate {

    /**
     * Event when text change.
     */
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        var currentText = ""
        if let searchBarText = userSearchBar.text {
            currentText = searchBarText
        }
        let keyword = (currentText as NSString).replacingCharacters(in: range, with: text)
        search(keyword: keyword)

        return true
    }
    /**
     * Function click search button.
     */
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let keyword = userSearchBar.text else {
            search(keyword: "") // Search all.
            return
        }
        search(keyword: keyword)
    }
    
    /**
     * Function click cancel button.
     */
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        userSearchBar.text = ""
        search(keyword: "")
    }
}
