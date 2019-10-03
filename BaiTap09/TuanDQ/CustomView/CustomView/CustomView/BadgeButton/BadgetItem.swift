//
//  BadgetItem.swift
//  CustomView
//
//  Created by MBA0051 on 10/3/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

protocol BadgeButtonItemDelegate: class {
    func viewDetailNotification(view: BadgetItem)
}

class BadgetItem: ParentView {

    @IBOutlet weak var badgetTypeButton: UIButton!
    @IBOutlet weak var badgetNumberLabel: UILabel!
    weak var delegate: BadgeButtonItemDelegate?
    
    private var buttonColor: UIColor = .blue
    private var badgetColor: UIColor = .red
    private var numberOfContent: Int = 1

    /**
     * Reference inheritent solution.
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        badgetTypeButton.layer.cornerRadius = 20
        badgetTypeButton.layer.masksToBounds = true
        badgetNumberLabel.layer.cornerRadius = 20
        badgetNumberLabel.layer.masksToBounds = true
        
        badgetTypeButton.frame = CGRect(x: 0, y: bounds.height / 4, width: bounds.width, height: bounds.height * 3 / 4)
        badgetTypeButton.backgroundColor = .blue

        badgetNumberLabel.frame = CGRect(x: bounds.width - bounds.height / 2, y: 0, width: bounds.height / 2, height: bounds.height / 4)
        badgetNumberLabel.backgroundColor = .red
    }
    
    /**
     * Click to view Notification detail.
     */
    @IBAction func viewNotificationClick(_ sender: UIButton) {
        delegate?.viewDetailNotification(view: self)
    }

    func setting(color: UIColor, type: String, number: Int) {
        badgetTypeButton.backgroundColor = color
        badgetTypeButton.setTitle(type, for: .normal)
        if number == 0 {
            badgetNumberLabel.isHidden = true
        } else {
            badgetNumberLabel.isHidden = false
            badgetNumberLabel.text = String(number)
        }
    }
}
