//
//  AViewController.swift
//  UINavigation
//
//  Created by PCI0007 on 7/9/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

class AViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "A"
        adjustButton()
    }
    
    func adjustButton() {
        nextButton.layer.borderWidth = 1
        nextButton.layer.borderColor = UIColor.blue.cgColor
        nextButton.layer.cornerRadius = 20
    }

    @IBAction func nextButtonTouchUpInside(_ sender: UIButton) {
        let b = BViewController()
        navigationController?.pushViewController(b, animated: true)
    }
    

}

