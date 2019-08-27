//
//  BookCell.swift
//  CollectionView
//
//  Created by PCI0008 on 8/23/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell {
    @IBOutlet weak var imageVieww: UIImageView!
    @IBOutlet weak var imageString: UILabel!
    @IBOutlet weak var movieName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
