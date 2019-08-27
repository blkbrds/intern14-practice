//
//  HomeViewController.swift
//  TabbarController
//
//  Created by PCI0008 on 8/22/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    var user: User = User()
    @IBOutlet private weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "HOME"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameLabel.text = "Welcome \(user.username)"
    }
}
