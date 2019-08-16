//
//  Ex9ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex9ViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties
    var exercise: Exercise?
    private var animals: [Animal] = []
    private var arrayAnimals: [[Animal]] = []
    private var indexTableView: [String] = []

    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Config
    override func setupUI() {
        super.setupUI()
        self.title = exercise?.name
        tableView.register(UINib(nibName: "AnimalNewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func setupData() {
        super.setupData()
        animals = DataManagement.share.getAnimals(fileName: "animalInfor", type: "plist")
        for i in 1...3 {
            arrayAnimals.append(animals)
            indexTableView.append("\(i)")
        }
    }
}

extension Ex9ViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayAnimals.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayAnimals[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? AnimalNewCell
        let animal = arrayAnimals[indexPath.section][indexPath.row]
        cell?.nameLabel.text = animal.name
        cell?.descriptionLabel.text = animal.descript
        cell?.avatarImageView.image = UIImage(named: animal.avatar)
        cell?.tapMeButton.tag = indexPath.row
        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("HomeCell --> Tap Me: \(indexPath.row)")
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(section + 1) Section"
    }

    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return indexTableView
    }

    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
}
