//
//  CustomCell.swift
//  ExTableView
//
//  Created by PCI0010 on 9/5/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var leftImageButton: UIButton!
    @IBOutlet weak var subNameLabel: UILabel!
    @IBOutlet weak var exImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
