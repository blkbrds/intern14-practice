//
//  FavoriteViewController.swift
//  ExCollectionViewHomeScreen
//
//  Created by PCI0010 on 9/10/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
     
    }

    func configUI() {
        title = "Favorite"
        navigationController?.navigationBar.backgroundColor = .cyan
    }
  

}
