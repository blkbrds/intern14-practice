//
//  UsersViewController.swift
//  TableView
//
//  Created by MBA0051 on 10/16/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {

    @IBOutlet weak var usersTableView: UITableView!
    var users: [String] = []
    let myIdentity = "myIdentity"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadDataFromPlist()
        configTableView()
    }

    private func loadDataFromPlist() {
        guard let filePath = Bundle.main.url(forResource: "userData", withExtension: "plist") else { return }
        guard let usersData = NSArray(contentsOf: filePath) as? [String] else {
            return
        }
        users = usersData
    }
    
    private func configTableView() {
        usersTableView.register(UITableViewCell.self, forCellReuseIdentifier: myIdentity)
        // Add datasource
        usersTableView.dataSource = self
        // Add delegate
        usersTableView.delegate = self
    }
}

extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: myIdentity, for: indexPath)
        cell.textLabel?.text = "\(users[indexPath.row])"
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension UsersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contactDetail = UserDetailViewController()
        contactDetail.displayName = users[indexPath.row]
        navigationController?.pushViewController(contactDetail, animated: true)
    }
}
