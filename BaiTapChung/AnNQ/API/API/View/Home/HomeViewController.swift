//
//  HomeViewController.swift
//  API
//
//  Created by MBA0217 on 10/21/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        loadData()
        if let viewModel = self.viewModel {
           viewModel.delegate = self
        }
    }

    // MARK: - Configuration UI
    private func configureUI() {
        title = "Home"
       
        let nib = UINib(nibName: "HomeTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "HomeTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    //Update UI
    func updateUI() {
        tableView.reloadData()
    }
    
    //Data
    func loadData() {
        //API
        viewModel?.loadData(completion: { (done) in
            if done {
                self.updateUI()
            }
        })
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewModel?.getNumberSection())!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        let item = viewModel?.getItem(indexPath: indexPath)
        
        if let item = item {
            cell.viewCellModel = HomeCellViewModel(place: item)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (viewModel?.getHeightForRow())!
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func showErrorMessage(_ errorMessage: String) {
        self.showAlertMessage(title: "Call API falure", message: errorMessage)
    }
    
    
}
