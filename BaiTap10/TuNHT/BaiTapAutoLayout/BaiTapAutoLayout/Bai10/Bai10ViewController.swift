//
//  Bai10ViewController.swift
//  BaiTapAutoLayout
//
//  Created by PCI0001 on 8/7/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class Bai10ViewController: UIViewController {
    @IBOutlet weak var widthBluePink: NSLayoutConstraint!
    @IBOutlet weak var widthPinkYellow: NSLayoutConstraint!
    @IBOutlet weak var widthYellowPurple: NSLayoutConstraint!
    @IBOutlet weak var widthPurpleBlue: NSLayoutConstraint!
    
    @IBOutlet weak var heightBluePink: NSLayoutConstraint!
    @IBOutlet weak var heightPinkYellow: NSLayoutConstraint!
    @IBOutlet weak var heightYellowPurple: NSLayoutConstraint!
    @IBOutlet weak var heightPurpleBlue: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func resetLayout() {
        widthBluePink.priority = UILayoutPriority(750)
        widthPinkYellow.priority = UILayoutPriority(750)
        widthYellowPurple.priority = UILayoutPriority(750)
        widthPurpleBlue.priority = UILayoutPriority(750)
        
        heightBluePink.priority = UILayoutPriority(250)
        heightPinkYellow.priority = UILayoutPriority(250)
        heightYellowPurple.priority = UILayoutPriority(250)
        heightPurpleBlue.priority = UILayoutPriority(250)
    }
    
    @IBAction func squareButtonTouchUpInside(_ button: UIButton) {
        if button.tag == 0 {
            resetLayout()
            heightBluePink.priority = UILayoutPriority(999)
            widthPinkYellow.priority = UILayoutPriority(999)
            widthYellowPurple.priority = UILayoutPriority(999)
        } else if button.tag == 1 {
            resetLayout()
            heightPinkYellow.priority = UILayoutPriority(999)
            widthYellowPurple.priority = UILayoutPriority(999)
            widthPurpleBlue.priority = UILayoutPriority(999)
        } else if button.tag == 2 {
            resetLayout()
            heightYellowPurple.priority = UILayoutPriority(999)
            widthPurpleBlue.priority = UILayoutPriority(999)
            widthBluePink.priority = UILayoutPriority(999)
        } else if button.tag == 3 {
            resetLayout()
            heightPurpleBlue.priority = UILayoutPriority(999)
            widthBluePink.priority = UILayoutPriority(999)
            widthPinkYellow.priority = UILayoutPriority(999)
        }
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
}
