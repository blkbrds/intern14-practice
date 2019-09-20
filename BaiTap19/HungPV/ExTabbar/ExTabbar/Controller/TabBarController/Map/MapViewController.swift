//
//  MapViewController.swift
//  ExTabbar
//
//  Created by PCI0010 on 9/10/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit
import RealmSwift

class MapViewController: UIViewController {

    let viewmodel = MapViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configData()
        configUI()
    }
    
    func configUI() {
        title = "Map"
        navigationController?.navigationBar.backgroundColor = .cyan
        tableView.register(UINib(nibName: "MapCell", bundle: nil), forCellReuseIdentifier: "mapCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configData() {
        fetchData()
    }
    
    func fetchData() {
        viewmodel.fetchData { (done) in
            if done {
                self.updateUI()
            } else {
                print("Can't fetch data.")
            }
        }
    }
    
    func updateUI() {
        self.tableView.reloadData()
    }
}

extension MapViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewmodel.numberOfItems(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "mapCell", for: indexPath) as? MapCell else { return UITableViewCell() }
        let myMusic = viewmodel.getMusic(with: indexPath)
        let cellViewModel = MapCellViewModel(myMusic: myMusic!)
        cell.viewmodel = cellViewModel
        
        return cell
    }
    
    func downloadCellImage(indexPath: IndexPath) {
        viewmodel.downloadCellImage(indexPath: indexPath) { (image, indexPath) in
            if let _ = image {
                self.tableView.reloadRows(at: [indexPath], with: .none)
            }
        }
    }
}

extension MapViewController: UIScrollViewDelegate {
    
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
