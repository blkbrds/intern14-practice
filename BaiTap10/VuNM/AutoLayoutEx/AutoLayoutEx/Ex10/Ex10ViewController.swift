//
//  Ex10ViewController.swift
//  AutoLayoutEx
//
//  Created by PCI0007 on 8/7/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

class Ex10ViewController: UIViewController {
    
    @IBOutlet weak var b3E2b4: NSLayoutConstraint!
    @IBOutlet weak var b3Eb4: NSLayoutConstraint!
    @IBOutlet weak var b2E2b3: NSLayoutConstraint!
    @IBOutlet weak var b2Eb3: NSLayoutConstraint!
    @IBOutlet weak var b1Eb2: NSLayoutConstraint!
    @IBOutlet weak var b1E2b2: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

  
    }

    @IBAction func userTapTouchUpInside(_ sender: UIButton) {
        if sender.tag == 0 {
            b3E2b4.priority = UILayoutPriority(rawValue: 500)
            b2E2b3.priority = UILayoutPriority(rawValue: 250)
            b1E2b2.priority = UILayoutPriority(rawValue: 250)
            b3Eb4.priority = UILayoutPriority(rawValue: 250)
            b2Eb3.priority = UILayoutPriority(rawValue: 500)
            b1Eb2.priority = UILayoutPriority(rawValue: 500)
        } else if sender.tag == 1 {
            b3E2b4.priority = UILayoutPriority(rawValue: 500)
            b2E2b3.priority = UILayoutPriority(rawValue: 250)
            b1E2b2.priority = UILayoutPriority(rawValue: 250)
            b3Eb4.priority = UILayoutPriority(rawValue: 250)
            b2Eb3.priority = UILayoutPriority(rawValue: 500)
            b1Eb2.priority = UILayoutPriority(rawValue: 500)
        } else if sender.tag == 2 {
            b3E2b4.priority = UILayoutPriority(rawValue: 500)
            b2E2b3.priority = UILayoutPriority(rawValue: 250)
            b1E2b2.priority = UILayoutPriority(rawValue: 250)
            b3Eb4.priority = UILayoutPriority(rawValue: 250)
            b2Eb3.priority = UILayoutPriority(rawValue: 500)
            b1Eb2.priority = UILayoutPriority(rawValue: 500)
        } else {
            b3E2b4.priority = UILayoutPriority(rawValue: 500)
            b2E2b3.priority = UILayoutPriority(rawValue: 250)
            b1E2b2.priority = UILayoutPriority(rawValue: 250)
            b3Eb4.priority = UILayoutPriority(rawValue: 250)
            b2Eb3.priority = UILayoutPriority(rawValue: 500)
            b1Eb2.priority = UILayoutPriority(rawValue: 500)
        }
    }
    


}
