//
//  ViewControllerC.swift
//  BaiTapNavigation
//
//  Created by PCI0013 on 7/9/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

class CViewController: UIViewController {

    @IBOutlet weak var rootButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.backgroundColor = .red
        title = "Viewcontroller C"    
}
    @IBAction func nextButtonTouchUpInside(_ sender: Any) {
        let homeViewController = DViewController()
        navigationController?.pushViewController(homeViewController, animated: true)
    }
    @IBAction func preButtonTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func rootButtonTouchUpInside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
