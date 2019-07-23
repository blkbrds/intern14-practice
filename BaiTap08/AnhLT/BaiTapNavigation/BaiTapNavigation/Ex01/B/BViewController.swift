//
//  ViewControllerB.swift
//  BaiTapNavigation
//
//  Created by PCI0013 on 7/9/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

class BViewController: UIViewController {

    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.backgroundColor = .red
        title = "Viewcontroller B"
    }
    
    @IBAction func nextButtonTouchUpInside(_ sender: Any) {
        let homeViewController = CViewController()
        navigationController?.pushViewController(homeViewController, animated: true)
    }
    @IBAction func preButtonTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
