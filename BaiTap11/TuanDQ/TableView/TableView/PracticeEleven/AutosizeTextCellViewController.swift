//
//  AutosizeTextCellViewController.swift
//  TableView
//
//  Created by MBA0051 on 10/17/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class AutosizeTextCellViewController: UIViewController {

    @IBOutlet weak var userTableView: UITableView!
    var listUser: [String] = []
    let identityName = "myIdentity"

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isToolbarHidden = true
        // Do any additional setup after loading the view.
        
        // Load data from plist file.
        listUser = LoadDataFromPlist.share.getListComments()
        configTableView()

        userTableView.estimatedRowHeight = 600
        userTableView.rowHeight = UITableView.automaticDimension
    }
    
    private func configTableView() {
        userTableView.register(UINib(nibName: "AutoSizeTableViewCell", bundle: nil), forCellReuseIdentifier: identityName)
        
        userTableView.dataSource = self
    }
}

extension AutosizeTextCellViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identityName, for: indexPath) as? AutoSizeTableViewCell else { return UITableViewCell(style: .default, reuseIdentifier: identityName) }
        cell.displayContenLabel.text = "\(listUser[indexPath.row])"
        cell.displayContenLabel.sizeToFit()
        cell.displayContenLabel.layoutIfNeeded()
        return cell
    }
}
