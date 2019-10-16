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
    let ext = "plist"
    let myIdentity = "myTableView"
    let customCellName = "CustomTableViewCell"

    @IBOutlet weak var animalTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadDataFromPlist()
        
        // Custom cell
        let nix = UINib(nibName: customCellName, bundle: nil)
        animalTableView.register(nix, forCellReuseIdentifier: myIdentity)
        animalTableView.dataSource = self
        
        // Create animal index
        animalsIndex.append("Home")
        animalsIndex.append("Reptiles")
        animalsIndex.append("Pantheras")
        animalsIndex.append("Herbivores")
//        createAnimalsIndex()
    }
    
    private func loadDataFromPlist() {
        guard let path = Bundle.main.url(forResource: plistName, withExtension: ext) else { return }
        guard let animalsPlist = NSArray(contentsOf: path) as? [Any]  else { return }
        
        for index in 0..<animalsPlist.count {
            guard let myArray = animalsPlist[index] as? [String] else { return }
            animals.append(myArray)
        }
        animals.remove(at: 0)
    }
    
    /**
     * Sort by animal name. => Not complete yet.
     */
    private func createAnimalsIndex() {
        var tempData: [[String]] = [[]]
        var tempIndex: [String] = []
        // Create index by prefix animal name.
        for animalArray in animals {
            for animalName in animalArray {
                var foundPrefix = false
                for prefix in 0..<animalsIndex.count {
                    if animalName.prefix(1).elementsEqual(animalsIndex[prefix]) {
                        tempData[prefix].append(animalName)
                        foundPrefix = true
                        break
                    }
                }
                if foundPrefix == false {
                    animalsIndex.append(String(animalName.prefix(1)))
                    tempIndex = []
                    tempIndex.append(animalName)
                    tempData.append(tempIndex)
                }
            }
        }
        animals = tempData
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
//        cell.textLabel?.text = animals[indexPath.section][indexPath.row]
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
