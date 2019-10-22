//
//  MultipleCollectionViewController.swift
//  MyCollectionView
//
//  Created by MBA0051 on 10/18/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class MultipleCollectionViewController: UIViewController {

    @IBOutlet weak var mainCollectionView: UICollectionView!
    @IBOutlet weak var containerCollectionView: UITableView!
    
    var animals: [[String]] = [[]]
    var animalIndex: [String] = []
    let myIdentity = "MyIdendity"
    private var index = 0
    let mainNo = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        animals = CommonLogic.share.loadGroupArrayFromPlist(plistName: "animalClassificate")
        animalIndex = CommonLogic.share.loadDefaultAnimalIndex()
        
        // Custom cell
        let nix = UINib(nibName: "CollectionItemViewCell", bundle: nil)
        containerCollectionView.register(nix, forCellReuseIdentifier: myIdentity)
        containerCollectionView.rowHeight = 100
        containerCollectionView.dataSource = self
        
        mainCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: myIdentity)

        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
        
    }

    @IBAction func changeCollectionItem(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            backToPreviousItem()
        default:
            nextItem()
        }
    }
    
    private func backToPreviousItem() {
        if (index > 0) {
            index -= 1
            let indexPath = IndexPath(item: index, section: 0)
            mainCollectionView.scrollToItem(at: indexPath, at: .left, animated: true)
        }
        
    }
    
    private func nextItem() {
        
        if (index < mainNo - 1) {
            index += 1
            let indexPath = IndexPath(item: index, section: 0)
            mainCollectionView.scrollToItem(at: indexPath, at: .right, animated: true)
        }
    }
}

extension MultipleCollectionViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: myIdentity, for: indexPath) as? CollectionItemViewCell else {
            return UITableViewCell()
        }
        cell.numbers = animals[indexPath.section]
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return animalIndex.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Home animal"
        case 1:
            return "Reptiles"
        case 2:
            return "Pantheras"
        default:
            return "Herbivores"
        }
    }
}

extension MultipleCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainNo
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: myIdentity, for: indexPath)
        cell.backgroundColor = .blue
        
        // Setting to label.
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: cell.contentView.frame.width, height: cell.contentView.frame.height))
        label.text = String(indexPath.row)
        label.textAlignment = .center
        label.textColor = .white
        
        cell.contentView.addSubview(label)

        // Constrain label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: cell.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
