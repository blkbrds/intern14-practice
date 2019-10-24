//
//  ScheduleHomeViewController.swift
//  DatingMessenger
//
//  Created by MBA0051 on 10/21/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

enum ScheduleIdentity: String {
    case table
    case collection
    
    var identityName: String {
        switch self {
        case .table: return "TableIdentity"
        case .collection: return "CollectionIdentity"
        }
    }
}
    
class ScheduleHomeViewController: UIViewController {

    @IBOutlet weak var scheduleTableView: UITableView!
    @IBOutlet weak var scheduleCollectionView: UICollectionView!
    var viewModel: ScheduleHomeViewModel?
    
    let scheduleTableNib = "ScheduleTableViewCell"
    let scheduleCollectionNib = "ScheduleCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isToolbarHidden = true
        // Do any additional setup after loading the view.
        let scheduleCell = UINib(nibName: scheduleTableNib, bundle: nil)
        scheduleTableView.register(scheduleCell, forCellReuseIdentifier: ScheduleIdentity.table.identityName)
        scheduleTableView.dataSource = self
        scheduleTableView.delegate = self
        
        let scheduleCollectionCell = UINib(nibName: scheduleCollectionNib, bundle: nil)
        scheduleCollectionView.register(scheduleCollectionCell.self, forCellWithReuseIdentifier: ScheduleIdentity.collection.identityName)
        scheduleCollectionView.dataSource = self
        scheduleCollectionView.delegate = self

        // reload data.
        if let viewModel = viewModel {
            viewModel.getSchedules { _ in
                self.scheduleTableView.reloadData()
            }
        }
        
//        scheduleCollectionView.isHidden = true
//        scheduleTableView.isHidden = false
    }

    @IBAction func switchDisplayButtonClick(_ sender: UIBarButtonItem) {
        if scheduleCollectionView.isHidden {
            scheduleCollectionView.isHidden = false
            scheduleTableView.isHidden = true
        } else {
            scheduleCollectionView.isHidden = true
            scheduleTableView.isHidden = false
        }
    }
}

extension ScheduleHomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let viewModel = viewModel {
            return viewModel.numberOfSections()
        }
        return 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let viewModel = viewModel {
            return viewModel.numberOfRowsInSection()
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ScheduleIdentity.table.identityName, for: indexPath) as? ScheduleTableViewCell else {
            return UITableViewCell()
        }
        if let viewModel = viewModel {
            cell.viewModel = viewModel.cellViewModel(at: indexPath)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = ScheduleDetailViewController()

        if let viewModel = viewModel {
            let detailModelView = viewModel.detailViewModel(at: indexPath)
            detailViewController.viewModel = detailModelView
        }
        
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension ScheduleHomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if let viewModel = viewModel {
            return viewModel.numberOfSections()
        }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let viewModel = viewModel {
            return viewModel.numberOfRowsInSection()
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScheduleIdentity.collection.identityName, for: indexPath) as? ScheduleCell else {
            return UICollectionViewCell()
        }

        cell.backgroundColor = .brown
        if let viewModel = viewModel {
            cell.viewModel = viewModel.cellViewModel(at: indexPath)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }
}
