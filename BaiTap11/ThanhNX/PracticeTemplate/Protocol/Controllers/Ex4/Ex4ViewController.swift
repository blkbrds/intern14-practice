//
//  Ex4ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex4ViewController: BaseViewController {
    //MARK: Outlet
    @IBOutlet private weak var cityTableView: UITableView!
    @IBOutlet private weak var citySearchBar: UISearchBar!
    
    //MARK: Propeties
    private var citys: [City] = City.Dummy.citys
    private var data: [City] = [City]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        citySearchBar.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = "Ex4"
        cityTableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    override func setupData() {
        super.setupData()
        data = citys
    }
}

//MARK: TableView DataSource
extension Ex4ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomCell else { return UITableViewCell() }
        let city = data[indexPath.row]
        cell.nameLabel.text = city.name
        return cell
    }
}

//MARK: TableView Delegate
extension Ex4ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}

//MARK: SearchBar Delegate
extension Ex4ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        data = searchText.isEmpty ? citys : citys.filter({ (dataString : City) -> Bool in
            return dataString.name.lowercased().contains(searchText.lowercased())
        })
        cityTableView.reloadData()
    }
}
