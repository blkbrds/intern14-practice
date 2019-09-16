//
//  HomeViewController.swift
//  ExTabbar
//
//  Created by PCI0010 on 9/10/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var viewmodel = HomeViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configData()
        configUI()
    }
    
    func configUI() {
        title = "Home"
        navigationController?.navigationBar.backgroundColor = .cyan
        
        tableView.register(UINib(nibName: "HomeCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configData() {
        loadData()
    }
    
    func loadData() {
        viewmodel.loadData { (done) in
            if done {
                tableView.reloadData()
            } else {
                print("Fail To Load Data!")
            }
        }
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewmodel.numberOfItems(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HomeCell else { return UITableViewCell() }
        
        let music = viewmodel.getMusic(with: indexPath)
        let cellViewModel = HomeCellViewModel(music: music!)
        
        cell.viewmodel = cellViewModel
    return cell }
    
    
}
