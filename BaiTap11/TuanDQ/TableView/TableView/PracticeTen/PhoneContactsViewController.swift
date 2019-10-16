//
//  PhoneContactsViewController.swift
//  TableView
//
//  Created by MBA0051 on 10/16/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class PhoneContactsViewController: UIViewController {

    @IBOutlet weak var animalTableView: UITableView!
    var animals: [[String]] = [[]]
    var animalsIndex: [String] = []
    let plistName = "animalClassificate"
    let myIdentity = "myTableView"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        (animalsIndex, animals) = createAnimalsIndex()
        
        animalTableView.register(UITableViewCell.self, forCellReuseIdentifier: myIdentity)
        animalTableView.dataSource = self
    }
    
    /**
     * Sort by animal name. => Not complete yet.
     */
    private func createAnimalsIndex() -> ([String], [[String]]) {
        
//        let myContacts = LoadDataFromPlist.share.getContactFromCNContact()
        
        let animalsData = LoadDataFromPlist.share.loadGroupArrayFromPlist(plistName: plistName)
        var tempData: [[String]] = [[]]
        var tempIndex: [String] = []
        // Create index by prefix animal name.
        tempData.remove(at: 0)
        for animalArray in animalsData {
            for animalName in animalArray {
                var foundPrefix = false
                for prefix in 0..<tempIndex.count {
                    if animalName.prefix(1).elementsEqual(tempIndex[prefix]) {
                        tempData[prefix].append(animalName)
                        foundPrefix = true
                        break
                    }
                }
                if foundPrefix == false {
                    tempIndex.append(String(animalName.prefix(1)))
                    var temp: [String] = []
                    temp.append(animalName)
                    tempData.append(temp)
                }
            }
        }
        
        // Sort by Alphabe
        for index in 0..<tempIndex.count-1 {
            for target in (index+1)..<tempIndex.count {
                if tempIndex[index].compare(tempIndex[target]).rawValue == 1 {
                    (tempIndex[index], tempIndex[target]) = (tempIndex[target], tempIndex[index])
                    (tempData[index], tempData[target]) = (tempData[target], tempData[index])
                }
            }
        }
        
        return (tempIndex, tempData)
    }
}

extension PhoneContactsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: myIdentity, for: indexPath)
        cell.textLabel?.text = animals[indexPath.section][indexPath.row]
        return cell
    }
    
    /**
     * Setting header section.
     */
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return animalsIndex[section]
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
