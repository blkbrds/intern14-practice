//
//  ViewController_A.swift
//  Navigation
//
//  Created by MBA0217 on 9/19/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

class ViewController_A: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController A"
    }

    @IBAction func nextTouchUpInside(_ sender: UIButton) {
        let bController = ViewController_B()
        navigationController?.pushViewController(bController, animated: true)
    }
}
