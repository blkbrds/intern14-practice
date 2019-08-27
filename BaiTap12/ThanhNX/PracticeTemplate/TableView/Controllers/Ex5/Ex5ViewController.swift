//
//  Ex5ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex5ViewController: BaseViewController {
    //MARK: Outlet
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    
    //MARK: Propeties
    var names: [UserName] = []
    var data: [UserName] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = "HOME"
        
        tableView.register(UINib(nibName: "NameUserCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    override func setupData() {
       names = DataManagement.share.getName(fileName: "ex2", type: "plist")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        data = names
        tableView.reloadData()
    }
}

extension Ex5ViewController: UITableViewDelegate, UITableViewDataSource {
    //MARK: TableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? NameUserCell else { return UITableViewCell() }
        let president = data[indexPath.row]
        cell.nameLabel.text = president.name
        return cell
    }
    
    //MARK: TableView Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = PresidentViewController()
        vc.name = self.data[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
        searchBar.text?.removeAll()
    }
}

//MARK: SearchBar Delegate
extension Ex5ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        data = searchText.isEmpty ? names : names.filter({ (dataString : UserName) -> Bool in
            return dataString.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
}
