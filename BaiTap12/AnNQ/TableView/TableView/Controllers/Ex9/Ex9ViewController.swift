//
//  Ex9ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex9ViewController: BaseViewController {

    var exercise: Exercise?
    @IBOutlet weak var tableView: UITableView!
    var users: [User] = []

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
        users = DataManagement.share.getUser(fileName: "users", type: "plist")
    }
    
    func configTableView () {
        //register table
        let nib = UINib(nibName: "Ex09TableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "Ex09TableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension Ex9ViewController: UITableViewDataSource, UITableViewDelegate {
    // amount of section in table
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    //amount of rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }

    //constructor and change return value in cell of table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Ex09TableViewCell", for: indexPath) as? Ex09TableViewCell
        let user = users[indexPath.row]
        cell?.nameLabel.text = user.name
        cell?.subTitleLabel.text = user.subTitle
        cell?.avatarImageView.image = UIImage(named: user.avatar)
        
        cell?.delegate = self
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Contacts"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

extension Ex9ViewController: Ex09TableViewCellDelegate {
    func callMe(_ ex09TableViewCell: Ex09TableViewCell) {
        var contactName = ""
        if let name = ex09TableViewCell.nameLabel.text {
            contactName = name
        }
        
        print("Call \(contactName)")
    }
    
}
