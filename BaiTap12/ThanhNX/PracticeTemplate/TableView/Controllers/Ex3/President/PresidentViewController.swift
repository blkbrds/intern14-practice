//
//  PresidentViewController.swift
//  TableView
//
//  Created by PCI0008 on 8/19/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

class PresidentViewController: BaseViewController {
    
    @IBOutlet private weak var presidentNameLabel: UILabel!
    
    var name: ExName?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = "DETAIL"
        presidentNameLabel.text = name?.name
    }
    
    override func setupData() {
    }
}
