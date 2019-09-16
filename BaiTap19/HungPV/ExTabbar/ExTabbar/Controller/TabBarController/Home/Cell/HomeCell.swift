//
//  HomeTableViewCell.swift
//  ExTabbar
//
//  Created by PCI0010 on 9/16/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {
    
    var viewmodel: HomeCellViewModel? {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        self.nameLabel.text = viewmodel?.name
        self.artistNameLabel.text = viewmodel?.artistName
        self.dateLabel.text = viewmodel?.releaseDate
        self.artworkImage.image = viewmodel?.artworkUrl100
        
    }

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var artistNameLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var artworkImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
