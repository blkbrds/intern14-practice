//
//  Ex05ViewController.swift
//  ExTableView
//
//  Created by PCI0010 on 9/5/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class Ex05ViewController: UIViewController {
    
    var names = [String]()
    var searchedName = [String]()
    var searching = false
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = " Ex05 "
        navigationController?.navigationBar.backgroundColor = .cyan
        names = DataManagement.share.getNameAcc(fileName: "Ex02", type: "plist")
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "ex05")
    }
    
}

extension Ex05ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchedName.count
        } else {
            return names.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ex05") as? CustomCell else { return UITableViewCell() }
        if searching {
            cell.nameLabel?.text = searchedName[indexPath.row]
        } else {
            cell.nameLabel?.text = names[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = Ex05DetailViewController()
        vc.textName = searchedName[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension Ex05ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedName = searchText.isEmpty ? names : names.filter({(dataString: String) -> Bool in
            return dataString.range(of: searchText, options: .caseInsensitive) != nil
        })
        searching = true
        tableView.reloadData()
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tableView.reloadData()
    }
}
