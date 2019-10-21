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
    var creature: [String: [Creature]] = [:]
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
        creature = ["users":users, "animals": animals]
    }
    
    func configTableView () {
        TableViewCell.loadNibCell("UserCell", self.tableView)
        TableViewCell.loadNibCell("AnimalCell", self.tableView)

        //register table
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
        switch section {
        case 0:
            return creature["users"]!.count
        default:
            return creature["animals"]!.count

        }
    }

    //constructor and change return value in cell of table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let userCell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell
            
            let value = creature["users"]![indexPath.row]
            userCell?.nameLabel.text = value.name
            userCell?.titleLabel.text = value.subTitle
            userCell?.avatarImageView.image = UIImage(named: value.avatar)
            
            userCell?.delegate = self
            
            return userCell!
        default:
            let animalCell = tableView.dequeueReusableCell(withIdentifier: "AnimalCell", for: indexPath) as? AnimalCell
            
            let value = creature["animals"]![indexPath.row]
            animalCell?.nameLabel.text = value.name
            animalCell?.titleLabel.text = value.subTitle
            animalCell?.avatarImageView.image = UIImage(named: value.avatar)
            
            animalCell?.delegate = self
            
            return animalCell!
        }
        
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

extension Ex9ViewController: UserCellDelegate {
    func userCell(cell: UserCell, needPerforms action: UserCell.Action) {
        print("Call \(cell.nameLabel.text)")
    }
    
}

extension Ex9ViewController: AnimalCellDelegate {
    func animalCell(cell: AnimalCell, needsPerform action: AnimalCell.Action) {
        switch cell.checkStatus {
        case true:
            UIView.animate(
               withDuration: 1.0,
               delay: 0.0,
               options: .curveEaseIn,
               animations: {
                   cell.iconButton.setImage(UIImage(named: "love_icon"), for: .normal)
               }
            )
        default:
            UIView.animate(
               withDuration: 1.0,
               delay: 0.0,
               options: .curveEaseIn,
               animations: {
                   cell.iconButton.setImage(UIImage(named: "heart_icon"), for: .normal)
               }
            )
        }
    }
}
