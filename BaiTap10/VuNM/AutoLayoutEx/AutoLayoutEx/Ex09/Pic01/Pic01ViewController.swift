//
//  Pic01ViewController.swift
//  AutoLayoutEx
//
//  Created by PCI0007 on 8/6/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

class Pic01ViewController: UIViewController {

    @IBOutlet weak var userScrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "1 / 10 "
        userScrollView.contentSize = CGSize(width: self.view.frame.width + 8000, height: self.view.frame.height)

        
    }




}
