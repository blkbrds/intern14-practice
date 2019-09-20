//
//  MapCell.swift
//  ExTabbar
//
//  Created by PCI0010 on 9/19/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class MapCell: UITableViewCell {
    var viewmodel: MapCellViewModel? {
        didSet {
           updateUI()
        }
    }
    
    func updateUI() {
        self.artistNameLabel.text = viewmodel?.artistName
        self.nameLabel.text = viewmodel?.name
        self.dateReleaseLabel.text = viewmodel?.releaseDate
        self.artworkImage.image = viewmodel?.artworkImage

    }

    @IBOutlet weak var dateReleaseLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artworkImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setArtworkImage(image: UIImage) {
        self.artworkImage.image = image
    }
    
}
