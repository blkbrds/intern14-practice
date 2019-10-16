//
//  DisplaySectionViewController.swift
//  TableView
//
//  Created by MBA0051 on 10/16/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class DisplaySectionViewController: UIViewController {

    var animals: [[String]] = [[]]
    let plistName = "animalClassificate"
    let ext = "plist"
    let myIdentity = "myTableView"
    @IBOutlet weak var animalTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadDataFromPlist()
        animalTableView.register(UITableViewCell.self, forCellReuseIdentifier: myIdentity)
        animalTableView.dataSource = self
        
    }
    
    private func loadDataFromPlist() {
        guard let path = Bundle.main.url(forResource: plistName, withExtension: ext) else { return }
        guard let animalsPlist = NSArray(contentsOf: path) as? [Any]  else { return }
        
        for index in 0..<animalsPlist.count {
            guard let myArray = animalsPlist[index] as? [String] else { return }
            animals.append(myArray)
        }
    }
}

extension DisplaySectionViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return "Home animal"
        case 2:
            return "Reptiles"
        case 3:
            return "Pantheras"
        case 4:
            return "herbivores"
        default:
            return "Others"
        }
    }

    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        switch section {
        case 1:
            return "Home animal"
        case 2:
            return "Reptiles"
        case 3:
            return "Pantheras"
        case 4:
            return "herbivores"
        default:
            return "Others"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: myIdentity, for: indexPath)
        cell.textLabel?.text = animals[indexPath.section][indexPath.row]
        return cell
    }
}
