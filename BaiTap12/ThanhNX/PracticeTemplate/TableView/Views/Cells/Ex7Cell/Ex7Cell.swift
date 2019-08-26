//
//  Ex7Cell.swift
//  TableView
//
//  Created by PCI0008 on 8/20/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

class Ex7Cell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
