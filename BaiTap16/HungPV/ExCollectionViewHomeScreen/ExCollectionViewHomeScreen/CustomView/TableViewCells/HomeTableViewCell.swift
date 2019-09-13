//
//  HomeTableViewCell.swift
//  ExCollectionViewHomeScreen
//
//  Created by PCI0010 on 9/11/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    var viewmodel: HomeTableViewModel? {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        self.nameTableLabel.text = viewmodel?.name
        self.locationTableLabel.text = viewmodel?.location
        self.ratingTableLabel.text = "\(viewmodel?.rating ?? 0 )/10"
        self.distanceTableLabel.text = "\(viewmodel?.distance ?? 0 )km"
        self.avatarImage.image = viewmodel?.avatarImage
    }
    
    @IBOutlet private weak var avatarImage: UIImageView!
    @IBOutlet private weak var nameTableLabel: UILabel!
    @IBOutlet private weak var locationTableLabel: UILabel!
    @IBOutlet private weak var ratingTableLabel: UILabel!
    @IBOutlet private weak var distanceTableLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
