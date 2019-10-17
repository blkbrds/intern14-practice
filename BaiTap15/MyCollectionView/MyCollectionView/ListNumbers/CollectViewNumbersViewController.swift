//
//  CollectViewNumbersViewController.swift
//  MyCollectionView
//
//  Created by MBA0051 on 10/17/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class CollectViewNumbersViewController: UIViewController {

    @IBOutlet weak var collectNumbersView: UICollectionView!
    let myIdentity = "MyIdentity"

    var numbers: [Int] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for index in 0..<50 {
            numbers.append(index)
        }

        // Set item size.
        let layout = collectNumbersView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: view.frame.width / 6, height: view.frame.width / 6)

        // Regist view collection.
        collectNumbersView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: myIdentity)
        collectNumbersView.dataSource = self
    }
}

extension CollectViewNumbersViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbers.count
    }
    
    /**
     * Set value to Cell.
     */
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: myIdentity, for: indexPath)
        cell.backgroundColor = .blue
        
        // Setting to label.
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: cell.contentView.frame.width, height: cell.contentView.frame.height))
        label.text = String(numbers[indexPath.row])
        label.textAlignment = .center
        label.textColor = .white
        
        cell.contentView.addSubview(label)

        // Constrain label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: cell.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
        return cell
    }
}
