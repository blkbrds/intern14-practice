//
//  TableView.swift
//  API
//
//  Created by MBA0217 on 10/21/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import Foundation
import UIKit

struct TableView {
    static func loadNibName(nibName: String, tableView: UITableView) {
        let nib = UINib(nibName: nibName, bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: nibName)
    }
}
