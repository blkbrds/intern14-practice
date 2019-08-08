//
//  Ex13ViewController.swift
//  AutoLayout
//
//  Created by Nguyen Duong on 8/8/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

class Ex13ViewController: BaseViewController {

    // MARK: - Properties
    var exercise: Exercise?

    // MARK: - Life cycle
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
