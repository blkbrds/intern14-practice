//
//  Ex10ViewController.swift
//  AutoLayoutEx
//
//  Created by PCI0007 on 8/7/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

class Ex10ViewController: UIViewController {
    
    @IBOutlet weak var heigtButton4n3Layout: NSLayoutConstraint!
    @IBOutlet weak var widthButton4n3Layout: NSLayoutConstraint!
    @IBOutlet weak var heightButton3n2Layout: NSLayoutConstraint!
    @IBOutlet weak var heightButton2n1Layout: NSLayoutConstraint!
    @IBOutlet weak var widthButton3n2Layout: NSLayoutConstraint!
    @IBOutlet weak var widthButton2n1Layout: NSLayoutConstraint!
    @IBOutlet weak var withdButton4n1Layout: NSLayoutConstraint!
    @IBOutlet weak var heightButton4n1Layout: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        standardValue()
    }
    
    func standardValue() {
        widthButton4n3Layout.priority = UILayoutPriority(750)
        widthButton3n2Layout.priority = UILayoutPriority(750)
        widthButton2n1Layout.priority = UILayoutPriority(750)
        withdButton4n1Layout.priority = UILayoutPriority(750)
        heigtButton4n3Layout.priority = UILayoutPriority(250)
        heightButton3n2Layout.priority = UILayoutPriority(250)
        heightButton2n1Layout.priority = UILayoutPriority(250)
        heightButton4n1Layout.priority = UILayoutPriority(250)
    }

    @IBAction func userTapTouchUpInside(_ sender: UIButton) {
        if sender.tag == 0 {
            standardValue()
            heigtButton4n3Layout.priority = UILayoutPriority(999)
            widthButton3n2Layout.priority = UILayoutPriority(999)
            widthButton2n1Layout.priority = UILayoutPriority(999)
        } else if sender.tag == 1 {
            standardValue()
            heightButton3n2Layout.priority = UILayoutPriority(999)
            widthButton2n1Layout.priority = UILayoutPriority(999)
            withdButton4n1Layout.priority = UILayoutPriority(999)
        } else if sender.tag == 2 {
            standardValue()
            heightButton2n1Layout.priority = UILayoutPriority(999)
            withdButton4n1Layout.priority = UILayoutPriority(999)
            widthButton4n3Layout.priority = UILayoutPriority(999)
        } else {
            standardValue()
            heightButton4n1Layout.priority = UILayoutPriority(999)
            widthButton3n2Layout.priority = UILayoutPriority(999)
            widthButton4n3Layout.priority = UILayoutPriority(999)
        }
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
}

