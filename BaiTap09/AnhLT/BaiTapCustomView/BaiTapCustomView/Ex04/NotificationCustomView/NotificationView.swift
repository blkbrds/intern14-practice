//
//  NotificationView.swift
//  BaiTapCustomView
//
//  Created by PCI0013 on 7/26/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit
enum BadgePosition {
    case topLeft
    case topRight
    case topCenter
    case centerLeft
    case centerRight
    case bottomLeft
    case bottomCenter
    case bottomRight
}

class NotificationView: UIView {
    var defaultButton: UIButton?
    var badgeLabel: UILabel?
    var titleLabel: UILabel?
    var badgeValue: Int
    var badgePosition: BadgePosition
    
    init(frame: CGRect, _ badgeValue: Int, _ badgePosition: BadgePosition) {
        self.badgePosition = badgePosition
        self.badgeValue = badgeValue
        super.init(frame: frame)
        
        defaultButton = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 80))
        defaultButton?.layer.cornerRadius = 10
        defaultButton?.layer.borderWidth = 1
        defaultButton?.addTarget(self, action: #selector(touchButton) , for: .touchUpInside)
        addSubview(defaultButton!)
        
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0 , width: 150, height: 80))
        titleLabel?.layer.cornerRadius = 10
        titleLabel?.layer.masksToBounds = true
        titleLabel?.textColor =  #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        titleLabel?.textAlignment = .center
        titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        addSubview(titleLabel!)
        
        badgeLabel = UILabel()
        //        badgeLabel?.backgroundColor =  #colorLiteral(red: 1, green: 0.01208707165, blue: 0, alpha: 1)
        //        badgeLabel?.textAlignment = .center
        //        badgeLabel?.textColor =  #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        //        badgeLabel?.text = "\(badgeValue)"
        //        badgeLabel?.layer.cornerRadius = 5
        //        badgeLabel?.layer.masksToBounds = true
        switch badgePosition {
        case .topRight:
            if badgeValue < 10 {
                badgeLabel?.text = "\(badgeValue)"
                badgeLabel?.frame = CGRect(x: 135, y: -10, width: 30, height: 20)
            } else if badgeValue <= 99 {
                badgeLabel?.text = "\(badgeValue)"
                badgeLabel?.frame = CGRect(x: 130, y: -10, width: 40, height: 20)
            } else if badgeValue > 99 {
                badgeLabel?.text = "99+"
                badgeLabel?.frame = CGRect(x: 125, y: -10, width: 50, height: 20)
            }
        case .topCenter:
            if badgeValue < 10 {
                badgeLabel?.text = "\(badgeValue)"
                badgeLabel?.frame = CGRect(x: 60, y: -10, width: 30, height: 20)
            } else if badgeValue <= 99 {
                badgeLabel?.text = "\(badgeValue)"
                badgeLabel?.frame = CGRect(x: 55, y: -10, width: 40, height: 20)
            } else if badgeValue > 99 {
                badgeLabel?.text = "99+"
                badgeLabel?.frame = CGRect(x: 50, y: -10, width: 50, height: 20)
            }
        case .centerRight:
            if badgeValue < 10 {
                badgeLabel?.text = "\(badgeValue)"
                badgeLabel?.frame = CGRect(x: 135, y: 30, width: 30, height: 20)
            } else if badgeValue <= 99 {
                badgeLabel?.text = "\(badgeValue)"
                badgeLabel?.frame = CGRect(x: 130, y: 30, width: 40, height: 20)
            } else if badgeValue > 99 {
                badgeLabel?.text = "99+"
                badgeLabel?.frame = CGRect(x: 125, y: 30, width: 50, height: 20)
            }
        case .centerLeft:
            if badgeValue < 10 {
                badgeLabel?.text = "\(badgeValue)"
                badgeLabel?.frame = CGRect(x: -15, y: 30, width: 30, height: 20)
            } else if badgeValue <= 99 {
                badgeLabel?.text = "\(badgeValue)"
                badgeLabel?.frame = CGRect(x: -20, y: 30, width: 40, height: 20)
            } else if badgeValue > 99 {
                badgeLabel?.text = "99+"
                badgeLabel?.frame = CGRect(x: -25, y: 30, width: 50, height: 20)
            }
        case .bottomLeft:
            if badgeValue < 10 {
                badgeLabel?.text = "\(badgeValue)"
                badgeLabel?.frame = CGRect(x: -15, y: 70, width: 30, height: 20)
            } else if badgeValue <= 99 {
                badgeLabel?.text = "\(badgeValue)"
                badgeLabel?.frame = CGRect(x: -20, y: 70, width: 40, height: 20)
            } else if badgeValue > 99 {
                badgeLabel?.text = "99+"
                badgeLabel?.frame = CGRect(x: -25, y: 70, width: 50, height: 20)
            }
        case .bottomRight:
            if badgeValue < 10 {
                badgeLabel?.text = "\(badgeValue)"
                badgeLabel?.frame = CGRect(x: 135, y: 70, width: 30, height: 20)
            } else if badgeValue <= 99 {
                badgeLabel?.text = "\(badgeValue)"
                badgeLabel?.frame = CGRect(x: 130, y: 70, width: 40, height: 20)
            } else if badgeValue > 99 {
                badgeLabel?.text = "99+"
                badgeLabel?.frame = CGRect(x: 125, y: 70, width: 50, height: 20)
            }
        case .bottomCenter:
            if badgeValue < 10 {
                badgeLabel?.text = "\(badgeValue)"
                badgeLabel?.frame = CGRect(x: 60, y: 70, width: 30, height: 20)
            } else if badgeValue <= 99 {
                badgeLabel?.text = "\(badgeValue)"
                badgeLabel?.frame = CGRect(x: 55, y: 70, width: 40, height: 20)
            } else if badgeValue > 99 {
                badgeLabel?.text = "99+"
                badgeLabel?.frame = CGRect(x: 50, y: 70, width: 50, height: 20)
            }
        case .topLeft:
            if badgeValue < 10 {
                badgeLabel?.text = "\(badgeValue)"
                badgeLabel?.frame = CGRect(x: -15, y: -10, width: 30, height: 20)
            } else if badgeValue <= 99 {
                badgeLabel?.text = "\(badgeValue)"
                badgeLabel?.frame = CGRect(x: -20, y: -10, width: 40, height: 20)
            } else if badgeValue > 99 {
                badgeLabel?.text = "99+"
                badgeLabel?.frame = CGRect(x: -25, y: -10, width: 50, height: 20)
            }
        }
            badgeLabel?.backgroundColor =  #colorLiteral(red: 1, green: 0.01208707165, blue: 0, alpha: 1)
            badgeLabel?.textAlignment = .center
            badgeLabel?.textColor =  #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            badgeLabel?.layer.cornerRadius = 10
            badgeLabel?.layer.masksToBounds = true
            
            if badgeValue > 0 {
                addSubview(badgeLabel!)
            }
        }
        
        @objc func touchButton() {
            print("tap!")
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}

