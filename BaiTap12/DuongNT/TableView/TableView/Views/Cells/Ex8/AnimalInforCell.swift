//
//  AnimalInforCell.swift
//  TableView
//
//  Created by Nguyen Duong on 8/16/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

class AnimalInforCell: UITableViewCell {

    @IBOutlet weak var animalImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
