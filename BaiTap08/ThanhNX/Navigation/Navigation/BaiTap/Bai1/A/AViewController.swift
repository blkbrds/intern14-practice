//
//  AViewController.swift
//  Navigation
//
//  Created by PCI0008 on 7/9/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

final class AViewController: UIViewController {
    @IBOutlet private weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.layer.cornerRadius = 50
        title = "Navigation A"
        navigationController?.navigationBar.backgroundColor = .cyan
    }
    
    @IBAction func nextButtonTouchUpInside(_ sender: UIButton) {
        let nextViewController = BViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
