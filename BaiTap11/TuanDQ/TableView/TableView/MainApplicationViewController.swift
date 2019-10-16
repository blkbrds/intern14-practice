//
//  MainApplicationViewController.swift
//  TableView
//
//  Created by MBA0051 on 10/16/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class MainApplicationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func moveToPracticeButtonClick(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            navigationController?.pushViewController(SimpleTableViewController(), animated: true)
        case 2:
            navigationController?.pushViewController(UserFromPlistViewController(), animated: true)
        case 3:
            navigationController?.pushViewController(UsersViewController(), animated: true)
        case 4:
            navigationController?.pushViewController(DisplaySectionViewController(), animated: true)
        case 5:
            navigationController?.pushViewController(SearchUsersViewController(), animated: true)
        case 6:
            navigationController?.pushViewController(CustomCellViewController(), animated: true)
        case 7:
            navigationController?.pushViewController(PhoneContactsViewController(), animated: true)
        default:
            navigationController?.pushViewController(UserFromPlistViewController(), animated: true)
        }
    }
}
