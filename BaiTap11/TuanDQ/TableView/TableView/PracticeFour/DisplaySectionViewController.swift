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
    var animalsIndex: [String] = []
    let plistName = "animalClassificate"
    let myIdentity = "myTableView"
    let customCellName = "CustomTableViewCell"

    @IBOutlet weak var animalTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        animals = LoadDataFromPlist.share.loadGroupArrayFromPlist(plistName: plistName)
        
        // Custom cell
        let nix = UINib(nibName: customCellName, bundle: nil)
        animalTableView.register(nix, forCellReuseIdentifier: myIdentity)
        animalTableView.dataSource = self
        
        // Create animal index
        animalsIndex = LoadDataFromPlist.share.loadDefaultAnimalIndex()
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
        case 0:
            return "Home animal"
        case 1:
            return "Reptiles"
        case 2:
            return "Pantheras"
        default:
            return "Herbivores"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: myIdentity, for: indexPath) as?  CustomTableViewCell else {
            return UITableViewCell(style: .default, reuseIdentifier: myIdentity)
        }
        cell.mainContentLabel.text = animals[indexPath.section][indexPath.row]
        return cell
    }
    
    /**
     * Index content.
     */
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return animalsIndex
    }

    /*
     * Setting index for table view.
     */
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
}
