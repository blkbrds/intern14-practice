//
//  PlaceCollectionViewCell.swift
//  CollectionView
//
//  Created by MBA0217 on 10/15/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

protocol PlaceCollectionViewCellDelegate: class {
    func favorite(cell: PlaceCollectionViewCell, perform: PlaceCollectionViewCell.Action)
}

class PlaceCollectionViewCell: UICollectionViewCell {

    enum Action {
        case favorite
    }
    
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    weak var delegate: PlaceCollectionViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateCollectionCell(image: String, name: String, address: String, point: Int, distance: Int, favorite: Bool) {
        placeImageView.image = UIImage(named: image)
        nameLabel.text = name
        addressLabel.text = address
        pointLabel.text = "\(point)/10"
        distanceLabel.text = "\(distance)Km"
        if favorite == true {
            favoriteButton.setImage(UIImage(named: "favorite"), for: .normal)
        } else {
            favoriteButton.setImage(UIImage(named: "star"), for: .normal)
        }
    }
    
    @IBAction func changeStatus(_ sender: UIButton) {
        if let delegate = self.delegate {
            delegate.favorite(cell: self, perform: .favorite)
        } else {
            print("Delegate is nil")
        }
    }
}
