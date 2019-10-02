//
//  MainViewController.swift
//  CustomViewPrototype
//
//  Created by MBA0051 on 10/2/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "MainViewController"
        loadComponent()
    }

    private func loadComponent() {
        guard let nib = Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?[0] as? MySliderView else {
            return
        }
        nib.frame = CGRect(x: 20, y: 100, width: 380, height: 200)
        self.view.addSubview(nib)
    }

}
