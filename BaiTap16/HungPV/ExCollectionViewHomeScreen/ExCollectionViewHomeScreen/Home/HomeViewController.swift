//
//  HomeViewController.swift
//  ExCollectionViewHomeScreen
//
//  Created by PCI0010 on 9/10/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionTableView: UICollectionView!
    
    var viewmodel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configData()
    }
    
    // Data
    func configData() {
        loadSlide()
        loadData()
    }
    
    func loadSlide() {
        viewmodel.loadSlide { (done) in
            if done {
                updateUI()
            } else {
                //show alert error
            }
        }
    }
    
    func loadData() {
        viewmodel.loadData { (done) in
            if done {
                updateUI()
            } else {
                //show alert error
            }
        }
    }
    
    // UI
    func updateUI() {
        //check state
        if viewmodel.isShowCollection {
            self.collectionView.isHidden = false
            self.tableView.isHidden = true
            
            let button = UIBarButtonItem(image: #imageLiteral(resourceName: "ic-list"), style: .plain, target: self, action: #selector(changeStyle))
            self.navigationItem.rightBarButtonItem = button
            
            self.collectionView.reloadData()
            
        } else {
            self.collectionView.isHidden = true
            self.tableView.isHidden = false
            
            let button = UIBarButtonItem(image: #imageLiteral(resourceName: "ic-list-square"), style: .plain, target: self, action: #selector(changeStyle))
            self.navigationItem.rightBarButtonItem = button
            
            self.tableView.reloadData()
        }
    }
    
    func configUI() {
        title = "Home"
        navigationController?.navigationBar.backgroundColor = .cyan
        view.addSubview(tableView)
        view.addSubview(collectionView)
        
        collectionView.register(UINib(nibName: "HomeCollectionCells", bundle: nil), forCellWithReuseIdentifier: "homecells")
        collectionView.register(UINib(nibName: "SlideImagesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "slidecells")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "tablecells")
        tableView.register(UINib(nibName: "SlideImagesTableViewCell", bundle: nil), forCellReuseIdentifier: "slidecells2")
        tableView.dataSource = self
        tableView.delegate = self
        
        let button = UIBarButtonItem(image: #imageLiteral(resourceName: "ic-list"), style: .plain, target: self, action: #selector(changeStyle))
        self.navigationItem.rightBarButtonItem = button
    }
    
    @objc func changeStyle() {
        viewmodel.changeState { (isShowCollection) in
            self.updateUI()
        }
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewmodel.numberOfSecsion()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewmodel.numberOfItems(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "slidecells", for: indexPath) as? SlideImagesCollectionViewCell else { return UICollectionViewCell() }
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homecells", for: indexPath) as? HomeCollectionCells else { return UICollectionViewCell() }
            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor.blue.cgColor
            
            let place = viewmodel.getPlace(with: indexPath)
            let cellViewModel = HomeCollectionViewModel(place: place!)
            cell.viewmodel = cellViewModel
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let place = viewmodel.getPlace(with: indexPath)
        let viewmodel = DetailViewModel(place: place!)
        
        let vc = DetailViewController()
        vc.viewmodel = viewmodel
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //Config: - homecells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: UIScreen.main.bounds.width , height: 250)
        }
        return CGSize(width: UIScreen.main.bounds.width / 2 - 10, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if section == 0 {
            return 0.0
        }
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if section == 0 {
            return 0.0
        }
        return 10
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewmodel.numberOfSecsion()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewmodel.numberOfItems(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "slidecells2", for: indexPath) as? SlideImagesTableViewCell else { return UITableViewCell() }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "tablecells", for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor.blue.cgColor
            
            let place = viewmodel.getPlace(with: indexPath)
            let cellViewModel = HomeTableViewModel(place: place!)
            cell.viewmodel = cellViewModel
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let place = viewmodel.getPlace(with: indexPath)
        let viewmodel = DetailViewModel(place: place!)
        
        let vc = DetailViewController()
        vc.viewmodel = viewmodel
        navigationController?.pushViewController(vc, animated: true)
    }
    
}


