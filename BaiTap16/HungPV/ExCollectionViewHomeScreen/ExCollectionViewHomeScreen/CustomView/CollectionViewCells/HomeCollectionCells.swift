//
//  HomeCollectionCells.swift
//  ExCollectionViewHomeScreen
//
//  Created by PCI0010 on 9/10/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class HomeCollectionCells: UICollectionViewCell {
    
    var viewmodel: HomeCollectionViewModel? {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI() {
        nameLabel.text = viewmodel?.name
        locationLabel.text = viewmodel?.location
        ratingLabel.text = "\(viewmodel?.rating ?? 0)/10"
        distanceLabel.text = "\(viewmodel?.distance ?? 0) km"
        avatarImage.image = viewmodel?.avatarImage
        
        if viewmodel!.isFavorite {
            self.starButton.setImage(UIImage(named: "ic-like"), for: .normal)
        } else {
            self.starButton.setImage(UIImage(named: "ic-liked"), for: .normal)
        }
    }

    @IBOutlet private weak var starButton: UIButton!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var distanceLabel: UILabel!
    @IBOutlet private weak var avatarImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func starButton(_ sender: Any) {
        viewmodel?.changeFavorite(completion: { (done) in
            if done {
                updateUI()
                //VC update array items
            } else {
                //show error
            }
        })
    }
}
