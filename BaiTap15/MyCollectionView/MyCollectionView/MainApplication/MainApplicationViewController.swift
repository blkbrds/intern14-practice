//
//  MainApplicationViewController.swift
//  MyCollectionView
//
//  Created by MBA0051 on 10/17/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class MainApplicationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func collectionViewButtonClick(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            navigationController?.pushViewController(CollectViewNumbersViewController(), animated: true)
        case 2:
            navigationController?.pushViewController(DynamicSizeViewController(), animated: true)
        case 3:
            navigationController?.pushViewController(CollectionAlbumsViewController(), animated: true)
        default:
            navigationController?.pushViewController(CollectViewNumbersViewController(), animated: true)
        }
    }
}
