//
//  Ex10ViewController.swift
//  ExAutoLayout
//
//  Created by PCI0010 on 8/30/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

enum chooseShape: Int {
    case redShape
    case blueShape
    case pinkShape
    case blackShape
}

class Ex10ViewController: UIViewController {
    
    @IBOutlet weak var widthRedBlue: NSLayoutConstraint!
    @IBOutlet weak var widthBluePink: NSLayoutConstraint!
    @IBOutlet weak var widthPinkBlack: NSLayoutConstraint!
    @IBOutlet weak var widthBlackRed: NSLayoutConstraint!
    
    @IBOutlet weak var heightRedBlue: NSLayoutConstraint!
    @IBOutlet weak var heightBluePink: NSLayoutConstraint!
    @IBOutlet weak var heightPinkBlack: NSLayoutConstraint!
    @IBOutlet weak var hegithBlackRed: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = " Ex10 "
    }
    
    func reset() {
        widthRedBlue.priority = UILayoutPriority(750)
        widthBluePink.priority = UILayoutPriority(750)
        widthPinkBlack.priority = UILayoutPriority(750)
        widthBlackRed.priority = UILayoutPriority(750)
        
        heightRedBlue.priority = UILayoutPriority(250)
        heightBluePink.priority = UILayoutPriority(250)
        heightPinkBlack.priority = UILayoutPriority(250)
        hegithBlackRed.priority = UILayoutPriority(250)
    }
    
    @IBAction func buttonDidClick(_ sender: UIButton) {
        guard let chooseShape = chooseShape(rawValue: sender.tag) else { return }
        reset()
        switch chooseShape {
        case .redShape:
            heightRedBlue.priority = UILayoutPriority(900)
            widthBluePink.priority = UILayoutPriority(900)
            widthPinkBlack.priority = UILayoutPriority(900)
        case .blueShape:
            heightBluePink.priority = UILayoutPriority(900)
            widthPinkBlack.priority = UILayoutPriority(900)
            widthBlackRed.priority = UILayoutPriority(900)
        case .pinkShape:
            heightPinkBlack.priority = UILayoutPriority(900)
            widthBlackRed.priority = UILayoutPriority(900)
            widthRedBlue.priority = UILayoutPriority(900)
        case .blackShape:
            hegithBlackRed.priority = UILayoutPriority(900)
            widthRedBlue.priority = UILayoutPriority(900)
            widthBluePink.priority = UILayoutPriority(900)
            
        }
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
}
