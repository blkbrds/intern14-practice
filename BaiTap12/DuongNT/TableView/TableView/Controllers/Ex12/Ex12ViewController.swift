//
//  Ex12ViewController.swift
//  TableView
//
//  Created by Nguyen Duong on 8/16/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

class Ex12ViewController: BaseViewController {

    // MARK: - Properties
    var exercise: Exercise?

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
        self.title = exercise?.name
    }

    override func setupData() {
        super.setupData()
    }
}
