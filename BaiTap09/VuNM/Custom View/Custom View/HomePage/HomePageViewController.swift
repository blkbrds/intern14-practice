//
//  HomePageViewController.swift
//  Custom View
//
//  Created by PCI0007 on 7/23/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {

    @IBOutlet var exButton: [UIButton]!
    let baitap: [UIViewController] = [Ex01ViewController(),Ex02ViewController(),Ex04ViewController(),DatePickerViewController(), PickerView(),Ex06ViewController()]
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func exButtonTouchUpInside(_ sender: UIButton) {
        navigationController?.pushViewController(baitap[sender.tag], animated: true)
    }
}
