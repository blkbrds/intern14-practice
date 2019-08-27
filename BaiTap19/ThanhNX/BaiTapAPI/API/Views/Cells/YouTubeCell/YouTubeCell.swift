//
//  YouTubeCell.swift
//  BaiTapAPI
//
//  Created by PCI0008 on 8/27/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

class YouTubeCell: UITableViewCell {
    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var titleVideo: UILabel!
    @IBOutlet weak var channelTitle: UILabel!
    @IBOutlet weak var publishTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
