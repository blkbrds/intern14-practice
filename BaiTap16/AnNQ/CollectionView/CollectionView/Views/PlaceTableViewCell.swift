//
//  PlaceTableViewCell.swift
//  CollectionView
//
//  Created by MBA0217 on 10/15/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

protocol PlaceTableViewCellDelegate: class {
    func favorite(cell: PlaceTableViewCell, perform: PlaceTableViewCell.Action)
}

class PlaceTableViewCell: UITableViewCell {

    enum Action {
        case favorite
    }
    
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    weak var delegate: PlaceTableViewCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateTableCell(place: Place) {
        placeImageView.image = UIImage(named: place.image)
        nameLabel.text = place.name
        addressLabel.text = place.address
        pointLabel.text = "\(place.point)/10"
        distanceLabel.text = "\(place.distance)Km"
        if place.favorite == true {
            favoriteButton.setImage(UIImage(named: "favorite"), for: .normal)
        } else {
            favoriteButton.setImage(UIImage(named: "star"), for: .normal)
        }
    }
    
    @IBAction func changeStatus(_ sender: UIButton) {
        if let delegate = self.delegate {
            delegate.favorite(cell: self, perform: .favorite)
        }
    }
    
}
