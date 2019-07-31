//
//  Bai5ViewController.swift
//  CustomView
//
//  Created by PCI0008 on 7/30/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

final class Bai5ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Bai 5"
    }
    @IBAction func pickerViewTouchUpInside() {
        let pc = PickerViewController()
        navigationController?.pushViewController(pc, animated: true)
    }
    
    @IBAction func DatePickerViewTouchUpInside() {
        let dpc = DatePickerViewController()
        navigationController?.pushViewController(dpc, animated: true)
    }
}
