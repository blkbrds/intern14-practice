//
//  CollectionSectionsViewController.swift
//  MyCollectionView
//
//  Created by MBA0051 on 10/18/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class CollectionSectionsViewController: UIViewController {

    var animals: [[String]] = [[]]
    var animalIndex: [String] = []
    let myIdentity = "MyIdendity"
    
    @IBOutlet weak var sectionsCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        animals = CommonLogic.share.loadGroupArrayFromPlist(plistName: "animalClassificate")
        animalIndex = CommonLogic.share.loadDefaultAnimalIndex()
        
        let layout = sectionsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: view.frame.width / 5, height: view.frame.width / 5)
        
        sectionsCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: myIdentity)
        sectionsCollectionView.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: myIdentity)
        sectionsCollectionView.dataSource = self
        sectionsCollectionView.delegate = self
    }
}

extension CollectionSectionsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return animals.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return animals[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: myIdentity, for: indexPath)
        cell.backgroundColor = .blue
        
        // Setting to label.
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: cell.contentView.frame.width, height: cell.contentView.frame.height))
        label.text = animals[indexPath.section][indexPath.row]
        label.textAlignment = .center
        label.textColor = .white
        
        cell.contentView.addSubview(label)

        // Constrain label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: cell.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: myIdentity, for: indexPath) as UICollectionReusableView
            
            // Setting to label.
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: header.frame.width, height: header.frame.height))
            label.text = animalIndex[indexPath.section]
            label.textAlignment = .left
            header.addSubview(label)
            // Constrain label
            label.translatesAutoresizingMaskIntoConstraints = false
            label.centerXAnchor.constraint(equalTo: header.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: header.centerYAnchor).isActive = true
            return header

        default:
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
}
