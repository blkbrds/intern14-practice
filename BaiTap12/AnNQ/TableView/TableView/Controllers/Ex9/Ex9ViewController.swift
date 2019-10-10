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
    var creature: [[Creature]] = []
    var createIndex: [String] = []


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
        let animals = DataManagement.share.getUser(fileName: "animals", type: "plist")
        let users = DataManagement.share.getUser(fileName: "users", type: "plist")
        
        createIndex = ["U", "A"]
        creature.append(users)
        creature.append(animals)
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
        return creature.count
    }

    //amount of rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return creature[section].count
    }

    //constructor and change return value in cell of table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Ex09TableViewCell", for: indexPath) as? Ex09TableViewCell
        
        let value = creature[indexPath.section][indexPath.row]
        cell?.nameLabel.text = value.name
        cell?.subTitleLabel.text = value.subTitle
        cell?.avatarImageView.image = UIImage(named: value.avatar)
        
        switch indexPath.section {
        case 0:
            cell?.callButton.isHidden = false
            cell?.heartButton.isHidden = true
        default:
            cell?.callButton.isHidden = true
            cell?.heartButton.isHidden = false
        }
        cell?.delegate = self
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Users"
        default:
            return "Animals"
        }
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return createIndex
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

extension Ex9ViewController: Ex09TableViewCellDelegate {
    func loveAnimal(_ ex09TableViewCell: Ex09TableViewCell) {
        var animalName = ""
        if let name = ex09TableViewCell.nameLabel.text {
            animalName = name
        }
        
        print("Love a \(animalName)")
    }
    
    func callMe(_ ex09TableViewCell: Ex09TableViewCell) {
        var userName = ""
        if let name = ex09TableViewCell.nameLabel.text {
            userName = name
        }
        
        print("Call \(userName)")
    }
    
}
