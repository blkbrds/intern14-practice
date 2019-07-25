//
//  ButtonView.swift
//  BaiTapCustomView
//
//  Created by PCI0001 on 7/25/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class ButtonView: UIView {
    var button: UIButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        button = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 100))
        button?.layer.borderWidth = 1
        button?.layer.cornerRadius = 10
        button?.titleLabel?.text = "Email"
        button?.titleLabel?.textColor = .white
        button?.titleLabel?.textAlignment = .center
        button?.addTarget(self, action: #selector(buttonTouchUpInside), for: .touchUpInside)
        addSubview(button!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonTouchUpInside() {
        
    }
}
