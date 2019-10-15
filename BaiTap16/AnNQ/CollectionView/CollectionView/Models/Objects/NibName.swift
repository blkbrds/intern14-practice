//
//  NibName.swift
//  CollectionView
//
//  Created by MBA0217 on 10/15/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import Foundation
import UIKit

struct NibName {
    static func loadNibTabelCell(nibName: String, tableView: UITableView) {
        let nib = UINib(nibName: nibName, bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: nibName)
    }
    
    static func loadNibCollectionCell(nibName: String, collectionView: UICollectionView) {
       let nib = UINib(nibName: nibName, bundle: .main)
       collectionView.register(nib, forCellWithReuseIdentifier: nibName)
    }
}
