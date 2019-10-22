//
//  HomeTableViewCell.swift
//  API
//
//  Created by MBA0217 on 10/21/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    var viewCellModel: HomeCellViewModel? {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        if let viewCellModel = viewCellModel {
            avatarImageView.image = UIImage(named: "")
            if let url = URL(string: viewCellModel.avatar ?? "") {
                let image = try? Data(contentsOf: url)
                avatarImageView.image = UIImage(data: image!)
            }
            nameLabel.text = viewCellModel.name
            addressLabel.text = viewCellModel.address
            scoreLabel.text = "\(viewCellModel.rating ?? 0)/10"
            distanceLabel.text = "\(viewCellModel.distance ?? 0)Km"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
