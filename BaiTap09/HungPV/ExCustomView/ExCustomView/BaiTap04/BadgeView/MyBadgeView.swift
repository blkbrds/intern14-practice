//
//  MyBadgeView.swift
//  ExCustomView
//
//  Created by PCI0010 on 8/22/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

enum Position {
    case topRight
    case topLeft
    case topCenter
    case centerRight
    case centerLeft
    case bottomRight
    case bottomLeft
    case bottomCenter
}

final class MyBadgeView: UIView {
    
    var badgeLabel: UILabel?
    var badgeTitle: UILabel?
    var value: Int
    var badgePosition: Position
    
    init(frame : CGRect, value: Int, badgePosition: Position) {
        self.value = value
        self.badgePosition = badgePosition
        super.init(frame: frame)
        
        badgeTitle = UILabel(frame: CGRect(x: 60, y: 10, width: 90, height: 70))
        badgeTitle?.backgroundColor = .clear
        badgeTitle?.textColor = .white
        badgeTitle?.textAlignment = .center
        badgeTitle?.font = badgeTitle?.font.withSize(25)
        if let badgeTitle = badgeTitle {
            addSubview(badgeTitle)
        }
        
        badgeLabel = UILabel()
        badgeLabel?.layer.masksToBounds = true
        badgeLabel?.backgroundColor = .red
        badgeLabel?.textColor = .white
        badgeLabel?.textAlignment = .center
        badgeLabel?.layer.cornerRadius = 8
        if value > 0 {
            addSubview(badgeLabel!)
        }
        
        switch badgePosition {
        case .topLeft :
            if value < 10 {
                badgeLabel?.frame = CGRect(x: -5, y: -10, width: 25, height: 25)
                badgeLabel?.text = "\(value)"
            } else if value <= 99 {
                badgeLabel?.frame = CGRect(x: -5, y: -10, width: 30, height: 30)
                badgeLabel?.text = "\(value)"
            } else if value > 99 {
                badgeLabel?.frame = CGRect(x: -5, y: -10, width: 35, height: 35)
                badgeLabel?.text = "99+"
            }
        case .topRight :
            if value < 10 {
                badgeLabel?.frame = CGRect(x: 188, y: -10, width: 25, height: 25)
                badgeLabel?.text = "\(value)"
            } else if value <= 99 {
                badgeLabel?.frame = CGRect(x: 188, y: -10, width: 30, height: 30)
                badgeLabel?.text = "\(value)"
            } else if value > 99 {
                badgeLabel?.frame = CGRect(x: 188, y: -10, width: 35, height: 35)
                badgeLabel?.text = "99+"
            }
        case .topCenter :
            if value < 10 {
                badgeLabel?.frame = CGRect(x: 92, y: -10, width: 25, height: 25)
                badgeLabel?.text = "\(value)"
            } else if value <= 99 {
                badgeLabel?.frame = CGRect(x: 92, y: -10, width: 30, height: 30)
                badgeLabel?.text = "\(value)"
            } else if value > 99 {
                badgeLabel?.frame = CGRect(x: 92, y: -10, width: 35, height: 35)
                badgeLabel?.text = "99+"
            }
        case .centerLeft :
            if value < 10 {
                badgeLabel?.frame = CGRect(x: -10, y: 30, width: 25, height: 25)
                badgeLabel?.text = "\(value)"
            } else if value <= 99 {
                badgeLabel?.frame = CGRect(x: -10, y: 30, width: 30, height: 30)
                badgeLabel?.text = "\(value)"
            } else if value > 99 {
                badgeLabel?.frame = CGRect(x: -10, y: 30, width: 35, height: 35)
                badgeLabel?.text = "99+"
            }
        case .centerRight :
            if value < 10 {
                badgeLabel?.frame = CGRect(x: 190, y: 30, width: 25, height: 25)
                badgeLabel?.text = "\(value)"
            } else if value <= 99 {
                badgeLabel?.frame = CGRect(x: 190, y: 30, width: 30, height: 30)
                badgeLabel?.text = "\(value)"
            } else if value > 99 {
                badgeLabel?.frame = CGRect(x: 190, y: 30, width: 35, height: 35)
                badgeLabel?.text = "99+"
            }
        case .bottomLeft :
            if value < 10 {
                badgeLabel?.frame = CGRect(x: -5, y: 70, width: 25, height: 25)
                badgeLabel?.text = "\(value)"
            } else if value <= 99 {
                badgeLabel?.frame = CGRect(x: -5, y: 70, width: 30, height: 30)
                badgeLabel?.text = "\(value)"
            } else if value > 99 {
                badgeLabel?.frame = CGRect(x: -5, y: 70, width: 35, height: 35)
                badgeLabel?.text = "99+"
            }
        case .bottomRight :
            if value < 10 {
                badgeLabel?.frame = CGRect(x: 192, y: 75, width: 25, height: 25)
                badgeLabel?.text = "\(value)"
            } else if value <= 99 {
                badgeLabel?.frame = CGRect(x: 192, y: 75, width: 30, height: 30)
                badgeLabel?.text = "\(value)"
            } else if value > 99 {
                badgeLabel?.frame = CGRect(x: 192, y: 75, width: 35, height: 35)
                badgeLabel?.text = "99+"
            }
        case .bottomCenter :
            if value < 10 {
                badgeLabel?.frame = CGRect(x: 92, y: 80, width: 25, height: 25)
                badgeLabel?.text = "\(value)"
            } else if value <= 99 {
                badgeLabel?.frame = CGRect(x: 92, y: 80, width: 30, height: 30)
                badgeLabel?.text = "\(value)"
            } else if value > 99 {
                badgeLabel?.frame = CGRect(x: 92, y: 80, width: 35, height: 35)
                badgeLabel?.text = "99+"
            }
            
        default:
            if value < 10 {
                badgeLabel?.frame = CGRect(x: -5, y: -10, width: 25, height: 25)
                badgeLabel?.text = "\(value)"
            } else if value <= 99 {
                badgeLabel?.frame = CGRect(x: -5, y: -10, width: 30, height: 30)
                badgeLabel?.text = "\(value)"
            } else if value > 99 {
                badgeLabel?.frame = CGRect(x: -5, y: -10, width: 35, height: 35)
                badgeLabel?.text = "99+"
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
