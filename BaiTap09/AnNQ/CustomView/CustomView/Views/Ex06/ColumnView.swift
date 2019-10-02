//
//  ColumnView.swift
//  CustomView
//
//  Created by MBA0217 on 10/2/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

class ColumnView: UIView {
    @IBOutlet weak var columnLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    static func loadNibNamed() -> ColumnView {
        let view = Bundle.main.loadNibNamed("ColumnView", owner: self, options: nil)?[0] as! ColumnView
        view.backgroundColor = .clear
        return view
    }
    
    func setupColumnView(value: CGFloat, x: CGFloat, frame: CGRect) {
        columnLabel.frame = CGRect(x: 0, y: frame.height, width: 22, height: -(value * 550 / 22))
        
         valueLabel.frame.origin.y = (550 - value * 550 / 22 - 20)
         valueLabel.text = "\(value)"
        print(columnLabel.frame, valueLabel.frame)
    }
}
