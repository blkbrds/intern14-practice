//
//  Ex3ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex3ViewController: BaseViewController {

    @IBOutlet weak var mienLabel: UILabel!
    @IBOutlet weak var tinhLabel: UILabel!
    @IBOutlet weak var huyenLabel: UILabel!
    
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
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonClicked))
        navigationItem.rightBarButtonItem = editButton
    }

    override func setupData() {
        super.setupData()
    }

    @objc func editButtonClicked() {
        let mienVC = MienViewController()
        mienVC.title = "Miền"
        navigationController?.pushViewController(mienVC, animated: true)
    }
}
