//
//  TableViewCell.swift
//  TableView
//
//  Created by MBA0217 on 10/11/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import Foundation
import UIKit

struct TableViewCell {
    static func loadNibCell(_ nibName: String,_ tableView: UITableView) {
        let nib = UINib(nibName: nibName, bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: nibName)
    }
}
