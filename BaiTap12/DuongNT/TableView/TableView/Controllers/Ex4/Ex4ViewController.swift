//
//  Ex4ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex4ViewController: BaseViewController {

<<<<<<< HEAD
    // MARK: - Properties
    var exercise: Exercise?
=======
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties
    var exercise: Exercise?
    var users: [User] = []
    var arrayUsers: [[User]] = []
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
>>>>>>> feature/DuongNT/protocol_06
    }

    override func setupData() {
        super.setupData()
<<<<<<< HEAD
=======
        users = DataManagement.share.getUser(fileName: "nameList", type: "plist")
        for _ in 1...3 {
            arrayUsers.append(users)
        }
    }
}

extension Ex4ViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayUsers.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayUsers[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let user = arrayUsers[indexPath.section][indexPath.row]
        cell.textLabel?.text = user.name
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section + 1)"
>>>>>>> feature/DuongNT/protocol_06
    }
}
