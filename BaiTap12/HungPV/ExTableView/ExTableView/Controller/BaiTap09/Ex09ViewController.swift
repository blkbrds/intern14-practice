//
//  Ex09ViewController.swift
//  ExTableView
//
//  Created by PCI0010 on 9/6/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class Ex09ViewController: UIViewController {
    
    var nameIndex: [String] = []
    var names = [[String]]()
    let nameViet = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = " Ex09 "
        navigationController?.navigationBar.backgroundColor = .cyan
        loadData()
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "ex09")
    }
    
    func loadData() {
        let nameBoy = ["Alexander","Arlo","Atticus","Clement","Enoch","Donald","Albert","Henry","Henry","Maximus","Raymond"]
        let nameGirl = ["Fidelia","Verity","Winifred","Zelda","Giselle","Elysia","Florence","Genevieve","Ariadne","Cleopatra","Rowena"]
        let nameViet = DataManagement.share.getNameAcc(fileName: "Ex02", type: "plist")
        self.names = [nameBoy, nameGirl, nameViet]
        nameIndex = ["B", "G", "V"]
    }
    
}

extension Ex09ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ex09") as? CustomCell else { return UITableViewCell() }
        cell.nameLabel?.text = names[indexPath.section][indexPath.row]
        cell.subNameLabel.text = "My Name"
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "B"
        case 1: return "G"
        default:
            return "V"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("HomeCell --> tap me : \(indexPath.row) - \(names[indexPath.section][indexPath.row])")
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return nameIndex
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
}
