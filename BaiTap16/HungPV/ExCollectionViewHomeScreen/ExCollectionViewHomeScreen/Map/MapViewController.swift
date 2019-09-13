//
//  MapViewController.swift
//  ExCollectionViewHomeScreen
//
//  Created by PCI0010 on 9/10/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
       
    }

    func configUI() {
        title = "Map"
        navigationController?.navigationBar.backgroundColor = .cyan
    }
 

}
