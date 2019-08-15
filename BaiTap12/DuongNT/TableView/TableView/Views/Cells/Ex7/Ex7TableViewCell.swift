//
//  Ex7TableViewCell.swift
//  TableView
//
//  Created by Nguyen Duong on 8/15/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

class Ex7TableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
