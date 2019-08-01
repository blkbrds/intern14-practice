//
//  BadgeView.swift
//  CustomView
//
//  Created by PCI0008 on 7/24/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

final class BadgeView: UIView {
    var label: UILabel = UILabel(frame: CGRect(origin: .zero, size: .init(width: 40, height: 20)))
    private let badgeFrame: CGRect = CGRect()
    
    var value: Int = 0 {
        didSet {
            updateValue()
        }
    }    
    
    init(value: Int) {
        super.init(frame: badgeFrame)
        self.value = value
        self.backgroundColor = .red
        
        label.textColor = .white
        label.textAlignment = .center
        self.addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func updateValue() {
        if value > 99 {
            label.text = "99+"
        } else {
            label.text = String(value)
        }        
    }
}
