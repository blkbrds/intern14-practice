//
//  ViewControllerA.swift
//  BaiTapNavigation
//
//  Created by PCI0013 on 7/9/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

class AViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.backgroundColor = .red
        title = "Viewcontroller A"
   
    }
    @IBAction func nextButtonTouchUpInside(_ sender: Any) {
        let homeViewController = BViewController()
        navigationController?.pushViewController(homeViewController, animated: true)
    }
}
