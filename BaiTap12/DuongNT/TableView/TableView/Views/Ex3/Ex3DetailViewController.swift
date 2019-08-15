//
//  Ex3DetailViewController.swift
//  TableView
//
//  Created by Nguyen Duong on 8/15/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

class Ex3DetailViewController: BaseViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Config
    override func setupUI() {
        super.setupUI()
        self.title = "DETAIL"
        nameLabel.text = name
    }

    override func setupData() {
        super.setupData()
    }
}
