//
//  TopAudioBookTableViewCell.swift
//  BaiTap2API
//
//  Created by Nguyen Duong on 8/23/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class TopAudioBookTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var attributeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
