//
//  MyButton.swift
//  CustomView
//
//  Created by Nguyen Duong on 7/23/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

class MyButton: UIView {

    // MARK: - Outlets
    @IBOutlet private weak var demoButton: UIButton!
    @IBOutlet private weak var myButtonView: MyButton!
    @IBOutlet private weak var badgeNumberLabel: UILabel!

    // MARK: - Lifecycle
    override func awakeFromNib() {
    }

    // MARK: - custom func
    func loadNib() {
        Bundle.main.loadNibNamed("MyButton", owner: self, options: nil)
        addSubview(myButtonView)
    }

    func setUpUIButton(color: UIColor?, name: String?, badge: Int?, position: Position?) {
        if let myColor: UIColor = color, let myName = name {
            myButtonView.demoButton.backgroundColor = myColor
            myButtonView.demoButton.layer.borderColor = myColor.cgColor
            myButtonView.demoButton.layer.borderWidth = 1
            myButtonView.demoButton.setTitle(myName, for: .normal)
        } else {
            myButtonView.demoButton.backgroundColor = .lightGray
            myButtonView.demoButton.setTitle("Default", for: .normal)
        }
        if let myName = name {
            myButtonView.demoButton.setTitle(myName, for: .normal)
        } else {
            myButtonView.demoButton.setTitle("Default", for: .normal)
        }
        myButtonView.demoButton.setTitleColor(.white, for: .normal)
        if let myBadge = badge {
            if myBadge <= 0 {
                badgeNumberLabel.isHidden = true
            } else if myBadge > 99 {
                badgeNumberLabel.text = "99+"
                badgeNumberLabel.frame.size.width = 30
            } else {
                if myBadge < 10 {
                    badgeNumberLabel.frame.size.width = 15
                } else {
                    badgeNumberLabel.frame.size.width = 20
                }
                badgeNumberLabel.text = "\(myBadge)"
            }
        } else {
            badgeNumberLabel.isHidden = true
        }
        myButtonView.demoButton.layer.cornerRadius = 5
        badgeNumberLabel.layer.cornerRadius = 5
        if let postionDefaut = position {
            switch postionDefaut {
            case .topLeft:
                badgeNumberLabel.center.x = myButtonView.demoButton.frame.origin.x
                badgeNumberLabel.center.y = myButtonView.demoButton.frame.origin.y
            case .topCenter:
                badgeNumberLabel.center.x = myButtonView.demoButton.frame.origin.x + myButtonView.demoButton.frame.size.width / 2
                badgeNumberLabel.center.y = myButtonView.demoButton.frame.origin.y
            case .topRight:
                badgeNumberLabel.center.x = myButtonView.demoButton.frame.origin.x + myButtonView.demoButton.frame.size.width
                badgeNumberLabel.center.y = myButtonView.demoButton.frame.origin.y
            case .centerLeft:
                badgeNumberLabel.center.x = myButtonView.demoButton.frame.origin.x
                badgeNumberLabel.center.y = myButtonView.demoButton.frame.origin.y + myButtonView.demoButton.frame.size.height / 2
            case .centerRight:
                badgeNumberLabel.center.x = myButtonView.demoButton.frame.origin.x + myButtonView.demoButton.frame.size.width
                badgeNumberLabel.center.y = myButtonView.demoButton.frame.origin.y + myButtonView.demoButton.frame.size.height / 2
            case .bottomLeft:
                badgeNumberLabel.center.x = myButtonView.demoButton.frame.origin.x
                badgeNumberLabel.center.y = myButtonView.demoButton.frame.origin.y + myButtonView.demoButton.frame.size.height
            case .bottomCenter:
                badgeNumberLabel.center.x = myButtonView.demoButton.frame.origin.x + myButtonView.demoButton.frame.size.width / 2
                badgeNumberLabel.center.y = myButtonView.demoButton.frame.origin.y + myButtonView.demoButton.frame.size.height
            case .bottomRight:
                badgeNumberLabel.center.x = myButtonView.demoButton.frame.origin.x + myButtonView.demoButton.frame.size.width
            badgeNumberLabel.center.y = myButtonView.demoButton.frame.origin.y + myButtonView.demoButton.frame.size.height
            }
        } else {
            badgeNumberLabel.center.x = myButtonView.demoButton.frame.origin.x
            badgeNumberLabel.center.y = myButtonView.demoButton.frame.origin.y
        }
    }
}
