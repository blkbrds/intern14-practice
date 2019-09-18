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
                self.updateUI()
                self.downCellImages()
            } else {
                print("Can't Load Data")
            }
        }
    }
    
    func updateUI() {
        self.tableView.reloadData()
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
       
        return cell
    }
    
    func downloadCellImage(indexPath: IndexPath) {
        viewmodel.downloadCellImage(indexPath: indexPath) { (image, indexPath) in
            if let _ = image {
                self.tableView.reloadRows(at: [indexPath], with: .left)
            }
        }
    }
}

extension HomeViewController: UIScrollViewDelegate {
    
    func downCellImages() {
        for cell in tableView.visibleCells {
            let indexPath = tableView.indexPath(for: cell)
            downloadCellImage(indexPath: indexPath!)
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            downCellImages()
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        downCellImages()
    }
}
