//
//  Ex12ViewController.swift
//  AutoLayout
//
//  Created by Nguyen Duong on 8/7/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

class Ex12ViewController: BaseViewController {

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
        let buttonPart2 = UIBarButtonItem(title: "Part2", style: .plain, target: self, action: #selector(changeToPart2))
        navigationItem.rightBarButtonItem = buttonPart2
    }

    override func setupData() {
        super.setupData()
    }

    // MARK: - private custom func
    @objc private func changeToPart2() {
        let vc = Ex12Part2ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
