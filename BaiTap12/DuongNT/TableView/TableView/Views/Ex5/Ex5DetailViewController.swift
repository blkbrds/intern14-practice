//
//  Ex5DetailViewController.swift
//  TableView
//
//  Created by Nguyen Duong on 8/15/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

class Ex5DetailViewController: BaseViewController {
    
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
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: #selector(backAction))
    }

    @objc func backAction() {
        
    }
    override func setupData() {
        super.setupData()
    }
}
