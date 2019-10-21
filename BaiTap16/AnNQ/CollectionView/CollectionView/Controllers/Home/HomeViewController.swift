//
//  HomeViewController.swift
//  TabBarController
//
//  Created by MBA0217 on 10/11/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var headerScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    var places: [Place] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configNavigation()
        pageControl.currentPage = 0
        loadNibTableView()
        loadNibCollectionView()
        loadDataFromPlist()
    }
    
    // MARK: Navigation
    func configNavigation() {
        self.title = "Home"
        let rightButton = UIBarButtonItem(image: UIImage(named: "table"), style: .plain, target: self, action: #selector(changeToCollectionView))
        navigationItem.rightBarButtonItem = rightButton
    }

    // MARK: objc change to collection view
    @objc func changeToCollectionView() {
        let rightButton = UIBarButtonItem(image: UIImage(named: "collection"), style: .plain, target: self, action: #selector(changeToTableViewView))
        navigationItem.rightBarButtonItem = rightButton
        tableView.isHidden = true
        collectionView.isHidden = false
        collectionView.reloadData()
    }
    
    // MARK: objc change to table view
    @objc func changeToTableViewView() {
        let rightButton = UIBarButtonItem(image: UIImage(named: "table"), style: .plain, target: self, action: #selector(changeToCollectionView))
        navigationItem.rightBarButtonItem = rightButton
        tableView.isHidden = false
        collectionView.isHidden = true
        tableView.reloadData()
    }
    
    // MARK: load plist
    func loadDataFromPlist() {
        places = DataManagement.share.getPlaces(fileName: "Places", type: "plist")
    }
    
    // MARK: loadNibTableView
    func loadNibTableView() {
        NibName.loadNibTabelCell(nibName: "PlaceTableViewCell", tableView: tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: loadNibCollectionView
    func loadNibCollectionView() {
           NibName.loadNibCollectionCell(nibName: "PlaceCollectionViewCell", collectionView: collectionView)
           collectionView.dataSource = self
           collectionView.delegate = self
       }
    
    @IBAction func changeImageView(_ sender: UIButton) {
        let currentOffsetX = headerScrollView.contentOffset.x
        switch sender.tag {
        case 0:
            if currentOffsetX != 0 {
                UIView.animate(
                    withDuration: 1.0,
                    delay: 0.0,
                    options: .curveEaseIn,
                    animations: {
                        self.headerScrollView.contentOffset.x -= self.headerScrollView.bounds.width
                    }
                )
            }
        case 1:
            if currentOffsetX != headerScrollView.contentSize.width - headerScrollView.bounds.width {
                UIView.animate(
                    withDuration: 1.0,
                    delay: 0.0,
                    options: .curveEaseIn,
                    animations: {
                        self.headerScrollView.contentOffset.x += self.headerScrollView.bounds.width
                    }
                )
            }
        default:
            break
        }
        pageControl.currentPage = Int(headerScrollView.contentOffset.x / headerScrollView.bounds.width)
    }
}

// MARK: UITableVIew
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "PlaceTableViewCell", for: indexPath) as! PlaceTableViewCell
        tableCell.updateTableCell(place: places[indexPath.row])
        tableCell.delegate = self
        return tableCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DetailViewController()
        controller.placeDetail = places[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}

// MARK: UICollectionView
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return places.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlaceCollectionViewCell", for: indexPath) as! PlaceCollectionViewCell
        collectionCell.updateCollectionCell(place: places[indexPath.item])
        collectionCell.delegate = self
        return collectionCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = DetailViewController()
        controller.placeDetail = places[indexPath.item]
        navigationController?.pushViewController(controller, animated: true)
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 185)
    }
}

// MARK: PlaceTableViewCell
extension HomeViewController: PlaceTableViewCellDelegate {
    func favorite(cell: PlaceTableViewCell, perform: PlaceTableViewCell.Action) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        places[indexPath.row].favorite = !places[indexPath.row].favorite
        switch places[indexPath.row].favorite {
        case true:
            UIView.animate(
               withDuration: 1.0,
               delay: 0.0,
               options: .curveEaseIn,
               animations: {
                  cell.favoriteButton.setImage(UIImage(named: "favorite"), for: .normal)
               }
            )
        default:
            UIView.animate(
               withDuration: 1.0,
               delay: 0.0,
               options: .curveEaseIn,
               animations: {
                   cell.favoriteButton.setImage(UIImage(named: "star"), for: .normal)
               }
            )
        }
    }
}

// MARK: PlaceCollectionViewCell
extension HomeViewController: PlaceCollectionViewCellDelegate {
    func favorite(cell: PlaceCollectionViewCell, perform: PlaceCollectionViewCell.Action) {
        guard let indexPath = collectionView.indexPath(for: cell) else { return }
        places[indexPath.item].favorite = !places[indexPath.item].favorite
        
        switch places[indexPath.item].favorite {
        case true:
            UIView.animate(
               withDuration: 1.0,
               delay: 0.0,
               options: .curveEaseIn,
               animations: {
                  cell.favoriteButton.setImage(UIImage(named: "favorite"), for: .normal)
               }
            )
        default:
            UIView.animate(
               withDuration: 1.0,
               delay: 0.0,
               options: .curveEaseIn,
               animations: {
                   cell.favoriteButton.setImage(UIImage(named: "star"), for: .normal)
               }
            )
        }
    }
}
