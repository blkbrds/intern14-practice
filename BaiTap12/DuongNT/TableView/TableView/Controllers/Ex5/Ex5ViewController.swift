//
//  Ex5ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex5ViewController: BaseViewController {

<<<<<<< HEAD
    // MARK: - Properties
    var exercise: Exercise?
=======
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties
    var exercise: Exercise?
    var users: [User] = []
    var filtered: [User] = []
    var searchActive : Bool = false
>>>>>>> feature/DuongNT/protocol_06

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
<<<<<<< HEAD
=======
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
>>>>>>> feature/DuongNT/protocol_06
    }

    override func setupData() {
        super.setupData()
<<<<<<< HEAD
=======
        users = DataManagement.share.getUser(fileName: "nameList", type: "plist")
    }
}

extension Ex5ViewController: UISearchBarDelegate {

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
        filtered = users.filter({( user : User) -> Bool in
            return user.name.lowercased().contains(searchText.lowercased())
        })
        if filtered.count == 0 {
            searchActive = false
        } else {
            searchActive = true
        }
        self.tableView.reloadData()
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterContentForSearchText(searchText)
    }
}

extension Ex5ViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchActive {
            return filtered.count
        } else {
            return users.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let user: User
        if searchActive {
            user = filtered[indexPath.row]
        } else {
            user = users[indexPath.row]
        }
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = Ex5DetailViewController()
        let user: User
        if searchActive {
            user = filtered[indexPath.row]
        } else {
            user = users[indexPath.row]
        }
        vc.name = user.name
        searchBar.text = nil
        filterContentForSearchText(searchBar.text ?? "")
        navigationController?.pushViewController(vc, animated: true)
>>>>>>> feature/DuongNT/protocol_06
    }
}
