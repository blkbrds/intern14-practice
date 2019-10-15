//
//  HexagonView.swift
//  AutoLayouts
//
//  Created by MBA0051 on 10/15/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class HexagonView: UIView {

    @IBOutlet weak var alarmLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    
    init(frame: CGRect, image: String) {
        super.init(frame: frame)
        self.mainImageView.image = UIImage(named: image)
        alarmLabel.isHidden = true
    }

    init(frame: CGRect, alarm: String) {
        super.init(frame: frame)
        self.alarmLabel.text = alarm
        mainImageView.isHidden = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
