//
//  ButtonView.swift
//  BaiTapCustomView
//
//  Created by PCI0001 on 7/25/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

enum BadgePosition {
    case none
    case topLeft
    case topRight
    case topCenter
    case centerLeft
    case centerRight
    case bottomLeft
    case bottomRight
    case bottomCenter
}

class ButtonView: UIView {
    var button: UIButton?
    var titleLabel: UILabel?
    var badgeLabel: UILabel?
    var value: Int
    var badgePosition: BadgePosition
    
    init(frame: CGRect, value: Int, badgePosition: BadgePosition) {
        self.value = value
        self.badgePosition = badgePosition
        super.init(frame: frame)
        
        button = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 100))
        button?.layer.borderWidth = 1
        button?.layer.cornerRadius = 10
        addSubview(button!)
        
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 100))
        titleLabel?.layer.cornerRadius = 10
        titleLabel?.font = UIFont.systemFont(ofSize: 25)
        titleLabel?.textColor = .white
        titleLabel?.textAlignment = .center
        addSubview(titleLabel!)
        
        badgeLabel = UILabel()
        switch badgePosition {
        case .none, .topLeft:
            if value < 10 {
                badgeLabel?.text = "\(value)"
                badgeLabel?.frame = CGRect(x: -15, y: -15, width: 30, height: 30)
                badgeLabel?.layer.cornerRadius = (badgeLabel?.bounds.width)! / 2
            } else if value <= 99 {
                badgeLabel?.text = "\(value)"
                badgeLabel?.frame = CGRect(x: -20, y: -15, width: 40, height: 30)
                badgeLabel?.layer.cornerRadius = 10
            } else {
                badgeLabel?.text = "99+"
                badgeLabel?.frame = CGRect(x: -25, y: -15, width: 50, height: 30)
                badgeLabel?.layer.cornerRadius = 10
            }
        case .topRight:
            if value < 10 {
                badgeLabel?.text = "\(value)"
                badgeLabel?.frame = CGRect(x: 135, y: -15, width: 30, height: 30)
                badgeLabel?.layer.cornerRadius = (badgeLabel?.bounds.width)! / 2
            } else if value <= 99 {
                badgeLabel?.text = "\(value)"
                badgeLabel?.frame = CGRect(x: 130, y: -15, width: 40, height: 30)
                badgeLabel?.layer.cornerRadius = 10
            } else {
                badgeLabel?.text = "99+"
                badgeLabel?.frame = CGRect(x: 125, y: -15, width: 50, height: 30)
                badgeLabel?.layer.cornerRadius = 10
            }
        case .topCenter:
            if value < 10 {
                badgeLabel?.text = "\(value)"
                badgeLabel?.frame = CGRect(x: 60, y: -15, width: 30, height: 30)
                badgeLabel?.layer.cornerRadius = (badgeLabel?.bounds.width)! / 2
            } else if value <= 99 {
                badgeLabel?.text = "\(value)"
                badgeLabel?.frame = CGRect(x: 55, y: -15, width: 40, height: 30)
                badgeLabel?.layer.cornerRadius = 10
            } else {
                badgeLabel?.text = "99+"
                badgeLabel?.frame = CGRect(x: 50, y: -15, width: 50, height: 30)
                badgeLabel?.layer.cornerRadius = 10
            }
        case .centerLeft:
            if value < 10 {
                badgeLabel?.text = "\(value)"
                badgeLabel?.frame = CGRect(x: -15, y: 35, width: 30, height: 30)
                badgeLabel?.layer.cornerRadius = (badgeLabel?.bounds.width)! / 2
            } else if value <= 99 {
                badgeLabel?.text = "\(value)"
                badgeLabel?.frame = CGRect(x: -20, y: 35, width: 40, height: 30)
                badgeLabel?.layer.cornerRadius = 10
            } else {
                badgeLabel?.text = "99+"
                badgeLabel?.frame = CGRect(x: -25, y: 35, width: 50, height: 30)
                badgeLabel?.layer.cornerRadius = 10
            }
        case .centerRight:
            if value < 10 {
                badgeLabel?.text = "\(value)"
                badgeLabel?.frame = CGRect(x: 135, y: 35, width: 30, height: 30)
                badgeLabel?.layer.cornerRadius = (badgeLabel?.bounds.width)! / 2
            } else if value <= 99 {
                badgeLabel?.text = "\(value)"
                badgeLabel?.frame = CGRect(x: 130, y: 35, width: 40, height: 30)
                badgeLabel?.layer.cornerRadius = 10
            } else {
                badgeLabel?.text = "99+"
                badgeLabel?.frame = CGRect(x: 125, y: 35, width: 50, height: 30)
                badgeLabel?.layer.cornerRadius = 10
            }
        case .bottomLeft:
            if value < 10 {
                badgeLabel?.text = "\(value)"
                badgeLabel?.frame = CGRect(x: -15, y: 85, width: 30, height: 30)
                badgeLabel?.layer.cornerRadius = (badgeLabel?.bounds.width)! / 2
            } else if value <= 99 {
                badgeLabel?.text = "\(value)"
                badgeLabel?.frame = CGRect(x: -20, y: 85, width: 40, height: 30)
                badgeLabel?.layer.cornerRadius = 10
            } else {
                badgeLabel?.text = "99+"
                badgeLabel?.frame = CGRect(x: -25, y: 85, width: 50, height: 30)
                badgeLabel?.layer.cornerRadius = 10
            }
        case .bottomRight:
            if value < 10 {
                badgeLabel?.text = "\(value)"
                badgeLabel?.frame = CGRect(x: 135, y: 85, width: 30, height: 30)
                badgeLabel?.layer.cornerRadius = (badgeLabel?.bounds.width)! / 2
            } else if value <= 99 {
                badgeLabel?.text = "\(value)"
                badgeLabel?.frame = CGRect(x: 130, y: 85, width: 40, height: 30)
                badgeLabel?.layer.cornerRadius = 10
            } else {
                badgeLabel?.text = "99+"
                badgeLabel?.frame = CGRect(x: 125, y: 85, width: 50, height: 30)
                badgeLabel?.layer.cornerRadius = 10
            }
        case .bottomCenter:
            if value < 10 {
                badgeLabel?.text = "\(value)"
                badgeLabel?.frame = CGRect(x: 60, y: 85, width: 30, height: 30)
                badgeLabel?.layer.cornerRadius = (badgeLabel?.bounds.width)! / 2
            } else if value <= 99 {
                badgeLabel?.text = "\(value)"
                badgeLabel?.frame = CGRect(x: 55, y: 85, width: 40, height: 30)
                badgeLabel?.layer.cornerRadius = 10
            } else {
                badgeLabel?.text = "99+"
                badgeLabel?.frame = CGRect(x: 50, y: 85, width: 50, height: 30)
                badgeLabel?.layer.cornerRadius = 10
            }
        }
        badgeLabel?.layer.masksToBounds = true
        badgeLabel?.textAlignment = .center
        badgeLabel?.backgroundColor = #colorLiteral(red: 1, green: 0.01208707165, blue: 0, alpha: 1)
        badgeLabel?.textColor = .white
        
        if value > 0 {
            addSubview(badgeLabel!)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
