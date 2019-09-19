//
//  ViewController_B.swift
//  Navigation
//
//  Created by MBA0217 on 9/19/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

class ViewController_B: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController B"
    }

    @IBAction func nextTouchUpInside(_ sender: UIButton) {
        let controller = ViewController_C()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func previousTouchUpInsidr(_ sender: UIButton) {
        for controller in navigationController!.viewControllers {
            if controller.isKind(of: ViewController_A.self) {
                navigationController?.popToViewController(controller, animated: true)
            }
        }
    }
}
