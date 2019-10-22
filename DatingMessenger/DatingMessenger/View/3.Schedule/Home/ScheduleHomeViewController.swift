//
//  ScheduleHomeViewController.swift
//  DatingMessenger
//
//  Created by MBA0051 on 10/21/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class ScheduleHomeViewController: UIViewController {

    let myIdentity = "identity"

    @IBOutlet weak var scheduleTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scheduleTableView.register(UITableViewCell.self, forCellReuseIdentifier: myIdentity)
        scheduleTableView.dataSource = self
        scheduleTableView.delegate = self
    }
}

extension ScheduleHomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: myIdentity, for: indexPath)
        cell.textLabel?.text = String(indexPath.row)
        cell.backgroundColor = .cyan
        return cell
    }
    

}
