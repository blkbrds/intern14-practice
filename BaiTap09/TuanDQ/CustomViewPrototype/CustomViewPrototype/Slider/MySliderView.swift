//
//  MySliderView.swift
//  CustomViewPrototype
//
//  Created by MBA0051 on 10/2/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class MySliderView: UIView {
    
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var mainSlider: UISlider!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBAction func changeValueEvent(_ sender: UISlider) {
        
    }
    
}
