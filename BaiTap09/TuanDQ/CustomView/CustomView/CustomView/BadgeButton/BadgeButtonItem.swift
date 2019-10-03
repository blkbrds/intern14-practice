//
//  BadgeButtonItem.swift
//  CustomView
//
//  Created by MBA0051 on 10/3/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

protocol BadgeButtonItemDelegate: class {
    func getValueChange(view: BadgeButtonItem, value: String)
}

class BadgeButtonItem: ParentView {

    @IBOutlet weak var badgetTypeButton: UIButton!
    @IBOutlet weak var badgetNumberLabel: UILabel!
    weak var delegate: BadgeButtonItemDelegate?
    
    private var buttonColor: UIColor = .blue
    private var badgetColor: UIColor = .red
    private var numberOfContent: Int = 1
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func badgetTypeClick(_ sender: UIButton) {
        
    }
    //    override func layoutMarginsDidChange() {
//        super.layoutMarginsDidChange()
////        guard let degreeView = degreeView, let sliderView = sliderView else { return }
//        badgetTypeButton.frame = CGRect(x: 0, y: bounds.height / 4, width: bounds.width, height: bounds.height * 3 / 4)
//        badgetTypeButton.backgroundColor = buttonColor
//        badgetTypeButton.layer.cornerRadius = 20
//
//        badgetNumberLabel.frame = CGRect(x: bounds.width - bounds.height / 2, y: 0, width: bounds.height / 2, height: bounds.height / 4)
//        badgetNumberLabel.backgroundColor = badgetColor
//        badgetNumberLabel.layer.cornerRadius = 20
//        setNumberOfContent(number: numberOfContent)
//    }

//    func setNumberOfContent(number numberContent: Int) {
//        badgetNumberLabel.text = String(numberOfContent)
//    }
    
}
