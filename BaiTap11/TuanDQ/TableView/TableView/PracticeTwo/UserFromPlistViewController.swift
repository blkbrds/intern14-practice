//
//  UserFromPlistViewController.swift
//  TableView
//
//  Created by MBA0051 on 10/16/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class UserFromPlistViewController: UIViewController {

    @IBOutlet weak var userTableView: UITableView!
    var listUser: [String] = []
    let identityName = "myIdentity"

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isToolbarHidden = true
        // Do any additional setup after loading the view.
        
        // Load data from plist file.
        loadDataFromPlist()
        configTableView()
    }

    private func loadDataFromPlist() {
        guard let path = Bundle.main.url(forResource: "userData", withExtension: "plist") else { return }
        guard let users = NSArray(contentsOf: path) as? [String] else {
            return
        }
        listUser = users
    }
    
    private func configTableView() {
        userTableView.register(UITableViewCell.self, forCellReuseIdentifier: identityName)
        userTableView.dataSource = self
    }
}

extension UserFromPlistViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identityName, for: indexPath)
        cell.textLabel?.text = "\(listUser[indexPath.row])"
        return cell
    }
    
    
}
