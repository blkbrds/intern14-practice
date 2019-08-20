//
//  ContactCell.swift
//  ContactList
//
//  Created by Nguyen Duong on 8/17/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var sexAndAgeLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
