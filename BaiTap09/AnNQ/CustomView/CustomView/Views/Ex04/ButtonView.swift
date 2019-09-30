//
//  ButtonView.swift
//  CustomView
//
//  Created by MBA0217 on 9/30/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

class ButtonView: UIView {

    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myButtonLabel: UILabel!
    
    
    
    func setupView(name: String, color: UIColor, backGrC: UIColor, badge: Int, position: Position) {
        myButton.setTitleColor(color, for: .normal)
        myButton.setTitle(name, for: .normal)
        myButton.backgroundColor = backGrC
        myButton.layer.borderColor = backgroundColor?.cgColor
        myButton.layer.borderWidth = 1
        myButton.layer.cornerRadius = 10
        
        if badge > 0 {
            if badge > 99 {
                myButtonLabel.text = "99+"
            } else {
                myButtonLabel.text = "\(badge)"
            }
            if badge < 10 {
                myButtonLabel.frame = CGRect(x: myButtonLabel.frame.origin.x, y: myButtonLabel.frame.origin.y, width: myButtonLabel.bounds.height, height: myButtonLabel.bounds.height)
                myButtonLabel.layer.cornerRadius = myButtonLabel.bounds.height / 2
            } else {
                myButtonLabel.layer.cornerRadius = 10
            }
            myButtonLabel?.layer.masksToBounds = true
            setupPosition(position)
        }
        
    }
    
    func setupPosition(_ position: Position) {
        switch position {
        case .topLeft:
            myButtonLabel.center.x = myButton.frame.origin.x
            myButtonLabel.center.y = myButton.frame.origin.y
        case .topCenter:
            myButtonLabel.center.x = myButton.frame.origin.x + myButton.frame.size.width / 2
            myButtonLabel.center.y = myButton.frame.origin.y
        case .topRight:
            myButtonLabel.center.x = myButton.frame.origin.x + myButton.frame.size.width
            myButtonLabel.center.y = myButton.frame.origin.y
        case .centerLeft:
            myButtonLabel.center.x = myButton.frame.origin.x
            myButtonLabel.center.y = myButton.frame.origin.y + myButton.frame.size.height / 2
        case .centerRight:
            myButtonLabel.center.x = myButton.frame.origin.x + myButton.frame.size.width
            myButtonLabel.center.y = myButton.frame.origin.y + myButton.frame.size.height / 2
        case .bottomLeft:
            myButtonLabel.center.x = myButton.frame.origin.x
            myButtonLabel.center.y = myButton.frame.origin.y + myButton.frame.size.height
        case .bottomCenter:
            myButtonLabel.center.x = myButton.frame.origin.x + myButton.frame.size.width / 2
            myButtonLabel.center.y = myButton.frame.origin.y + myButton.frame.size.height
        case .bottomRight:
            myButtonLabel.center.x = myButton.frame.origin.x + myButton.frame.size.width
            myButtonLabel.center.y = myButton.frame.origin.y + myButton.frame.size.height
        }    }
}

extension ButtonView {
    static func loadNibNamed() -> ButtonView {
        return Bundle.main.loadNibNamed("ButtonView", owner: self, options: nil)?[0] as! ButtonView
    }
}
