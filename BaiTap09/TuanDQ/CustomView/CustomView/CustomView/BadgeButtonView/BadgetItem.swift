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
    private var currentPosition: Int = 3
    /**
     * Reference inheritent solution.
     */
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    /**
     * Auto change size - Supported by Tuan Mai.
     */
    override func layoutMarginsDidChange() {
        super.layoutMarginsDidChange()
        badgetTypeButton.layer.cornerRadius = 15
        badgetTypeButton.layer.masksToBounds = true
        badgetNumberLabel.layer.cornerRadius = 15
        badgetNumberLabel.layer.masksToBounds = true

        switch currentPosition {
        case 1: // Top left
            badgetTypeButton.frame = CGRect(x: 0, y: bounds.size.height / 4, width: bounds.width, height: bounds.size.height * 3 / 4)
            badgetNumberLabel.frame = CGRect(x: 0 / 2, y: badgetTypeButton.frame.origin.y - bounds.height / 8, width: bounds.height / 2, height: bounds.height / 4)
        case 2: // Top center
            badgetTypeButton.frame = CGRect(x: 0, y: bounds.size.height / 4, width: bounds.width, height: bounds.size.height * 3 / 4)
            badgetNumberLabel.frame = CGRect(x: bounds.width / 2 - bounds.height / 8, y: badgetTypeButton.frame.origin.y - bounds.height / 8, width: bounds.height / 4, height: bounds.height / 4)
            badgetNumberLabel.layer.cornerRadius = badgetNumberLabel.frame.width / 2
        case 3: // Top right
            badgetTypeButton.frame = CGRect(x: 0, y: bounds.size.height / 4, width: bounds.width, height: bounds.size.height * 3 / 4)
            badgetNumberLabel.frame = CGRect(x: bounds.width - bounds.height / 2, y: badgetTypeButton.frame.origin.y - bounds.height / 8, width: bounds.height / 2, height: bounds.height / 4)
        case 4: // Bot right
            badgetTypeButton.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.size.height * 3 / 4)
            badgetNumberLabel.frame = CGRect(x: bounds.width - bounds.height / 2, y: badgetTypeButton.frame.height - bounds.height / 8, width: bounds.height / 2, height: bounds.height / 4)
        case 5: // Bot center
            badgetTypeButton.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.size.height * 3 / 4)
            badgetNumberLabel.frame = CGRect(x: bounds.width / 2 - bounds.height / 8, y: badgetTypeButton.frame.height - bounds.height / 8, width: bounds.height / 4, height: bounds.height / 4)
            badgetNumberLabel.layer.cornerRadius = badgetNumberLabel.frame.width / 2
        case 6: // Bot left
            badgetTypeButton.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.size.height * 3 / 4)
            badgetNumberLabel.frame = CGRect(x: 0, y: badgetTypeButton.frame.height - bounds.height / 8, width: bounds.height / 2, height: bounds.height / 4)
        case 7: // Midle left
            badgetTypeButton.frame = CGRect(x: 0, y: bounds.size.height / 8, width: bounds.width, height: bounds.size.height * 3 / 4)
            badgetNumberLabel.frame = CGRect(x: badgetTypeButton.frame.origin.x - bounds.height / 8, y: badgetTypeButton.frame.height / 2 - bounds.height / 16, width: bounds.height / 4, height: bounds.height / 4)
            badgetNumberLabel.layer.cornerRadius = badgetNumberLabel.frame.width / 2
        case 8: // Midle right
            badgetTypeButton.frame = CGRect(x: 0, y: bounds.size.height / 8, width: bounds.width, height: bounds.size.height * 3 / 4)
            badgetNumberLabel.frame = CGRect(x: badgetTypeButton.frame.width - bounds.height / 8, y: badgetTypeButton.frame.height / 2 - bounds.height / 16, width: bounds.height / 4, height: bounds.height / 4)
            badgetNumberLabel.layer.cornerRadius = badgetNumberLabel.frame.width / 2
        default:
            badgetTypeButton.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.size.height * 3 / 4)
            badgetNumberLabel.frame = CGRect(x: bounds.width - bounds.height / 2, y: badgetTypeButton.frame.height - bounds.height / 8, width: bounds.height / 2, height: bounds.height / 4)
        }
    }
    
    /**
     * Click to view Notification detail.
     */
    @IBAction func viewNotificationClick(_ sender: UIButton) {
        delegate?.viewDetailNotification(view: self)
    }

    func setting(color: UIColor, type: String, number: Int, location: Int) {
        currentPosition = location
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
