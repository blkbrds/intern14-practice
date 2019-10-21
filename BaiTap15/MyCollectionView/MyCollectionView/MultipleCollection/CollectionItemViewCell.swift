//
//  CollectionItemViewCell.swift
//  MyCollectionView
//
//  Created by MBA0051 on 10/18/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class CollectionItemViewCell: UITableViewCell {

    @IBOutlet weak var mainCollectionView: UICollectionView!
    let myIdentity = "MyIdentity"
    var numbers: [String] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        // Do any additional setup after loading the view.
        
        // Set item size.
        let layout = mainCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: contentView.frame.width / 6, height: contentView.frame.width / 6)

        // Regist view collection.
        mainCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: myIdentity)
        mainCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension CollectionItemViewCell: UICollectionViewDataSource {
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
        
        // Setting for re-use item.
        let subViews = cell.contentView.subviews
        for view in subViews where view is UILabel {
            if let view = view as? UILabel {
                view.text = String(numbers[indexPath.row])
                return cell
            }
        }

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
