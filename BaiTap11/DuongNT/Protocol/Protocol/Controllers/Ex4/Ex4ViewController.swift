//
//  Ex4ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex4ViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties
    var exercise: Exercise?
    var cities = [City]()
    let searchController = UISearchController(searchResultsController: nil)
    var filteredCities = [City]()
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
        tableView.register(UINib(nibName: "MienCell", bundle: nil), forCellReuseIdentifier: "cell")
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search bar"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

    override func setupData() {
        super.setupData()
        cities = DataManagement.share.getCities(fileName: "cities", type: "plist")
    }

    // MARK: - Private instance methods
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }

    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredCities = cities.filter({( city : City) -> Bool in
            return city.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
}

extension Ex4ViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
extension Ex4ViewController: UITableViewDelegate, UITableViewDataSource {

    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }

    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredCities.count
        }
        
        return cities.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? MienCell
        let city: City
        if isFiltering() {
            city = filteredCities[indexPath.row]
        } else {
            city = cities[indexPath.row]
        }
        cell?.nameLabel.text = city.name
        return cell!
    }
    

}
