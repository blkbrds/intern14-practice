//
//  CustomCellViewController.swift
//  TableView
//
//  Created by MBA0051 on 10/16/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class CustomCellViewController: UIViewController {

    @IBOutlet weak var userTableView: UITableView!
    var animals: [[String]] = [[]]
    var animalsIndex: [String] = []
    let plistName = "animalClassificate"
    let ext = "plist"

    let identityName = "myIdentity"
    let nibFileName = "CustomCellTableViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadDataFromPlist()
        configTableView()
    }

    private func loadDataFromPlist() {
        guard let path = Bundle.main.url(forResource: plistName, withExtension: ext) else { return }
        guard let animalsPlist = NSArray(contentsOf: path) as? [Any]  else { return }
        
        for index in 0..<animalsPlist.count {
            guard let myArray = animalsPlist[index] as? [String] else { return }
            animals.append(myArray)
        }
        animals.remove(at: 0)
        
        // Create animal index
        animalsIndex.append("Home")
        animalsIndex.append("Reptiles")
        animalsIndex.append("Pantheras")
        animalsIndex.append("Herbivores")
    }

    private func configTableView() {
        // Load from Nib file.
        let nib = UINib(nibName: nibFileName, bundle: nil)
        userTableView.register(nib, forCellReuseIdentifier: identityName)
        userTableView.dataSource = self

//        userTableView.register(UITableViewCell.self, forCellReuseIdentifier: identityName)
//        userTableView.dataSource = self
    }
}

extension CustomCellViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return animals.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Cast cell to customCell.
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identityName, for: indexPath) as? CustomCellTableViewCell else {
            return UITableViewCell(style: .default, reuseIdentifier: identityName)
        }
        // Setting data.
        cell.userName.text = animals[indexPath.section][indexPath.row]
        cell.indexPath = indexPath
        // Assign delegate.
        cell.delegate = self
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
}

extension CustomCellViewController: CustomCellTableViewCellDelegate {
    func tapButtonClick(view: CustomCellTableViewCell) {
        guard let rowIndex = view.indexPath?.row else { return }
        print("Tap me : \(String(rowIndex))")
    }
}
