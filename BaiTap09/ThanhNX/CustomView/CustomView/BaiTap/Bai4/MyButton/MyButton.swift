//
//  MyButton.swift
//  CustomView
//
//  Created by PCI0008 on 7/24/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

enum BadgePosition {
    case none
    case topRight
    case topLeft
    case topCenter
    case centerLeft
    case centerRight
    case bottomLeft
    case bottomCenter
    case bottomRight
}

final class MyButton: UIView {
    private var badgeView: BadgeView?
    private let label: UILabel = UILabel(frame: CGRect(x: 35, y: 35, width: 80, height: 15))
    
    public var title: String? {
        didSet {
            updateTitle()
        }
    }
    
    public var badgeNumber: Int
    public var badgePosition: BadgePosition
    
    init(frame: CGRect, badgeNumber: Int, badgePosition: BadgePosition = .topLeft) {
        self.badgeNumber = badgeNumber
        self.badgePosition = badgePosition
        super.init(frame: frame)
        
        badgeView = BadgeView(value: badgeNumber)
        badgeView?.layer.cornerRadius = 10
        badgeView?.value = badgeNumber
        switch badgePosition {
        case .none:
            badgeView?.frame = CGRect(origin: .zero, size: .zero)
        case .topRight:
            badgeView?.frame = CGRect(x: 130, y: -5, width: 40, height: 20)
        case .topLeft:
            badgeView?.frame = CGRect(x: -20, y: -5, width: 40, height: 20)
        case .topCenter:
            badgeView?.frame = CGRect(x: 55, y: -5, width: 40, height: 20)
        case .centerLeft:
            badgeView?.frame = CGRect(x: -20, y: 30, width: 40, height: 20)
        case .centerRight:
            badgeView?.frame = CGRect(x: 130, y: 30, width: 40, height: 20)
        case .bottomLeft:
            badgeView?.frame = CGRect(x: -20, y: 70, width: 40, height: 20)
        case .bottomCenter:
            badgeView?.frame = CGRect(x: 55, y: 70, width: 40, height: 20)
        case .bottomRight:
            badgeView?.frame = CGRect(x: 130, y: 70, width: 40, height: 20)
        }
        
        label.textAlignment = .center
        label.textColor = .white
        self.addSubview(label)
        if badgeNumber > 0 {
            self.addSubview(badgeView!)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateTitle() {
        label.text = title
    }
}
