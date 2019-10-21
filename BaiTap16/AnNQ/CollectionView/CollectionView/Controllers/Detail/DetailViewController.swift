//
//  DetailViewController.swift
//  CollectionView
//
//  Created by MBA0217 on 10/15/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var placeImageVIew: UIImageView!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    var placeDetail: Place?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Detail"
        configUI()
    }
    
    private func configUI() {
        placeImageVIew.image = UIImage(named: placeDetail!.image)
        nameLabel.text = placeDetail?.name
        addressLabel.text = placeDetail?.address
        pointLabel.text = "\(String(describing: placeDetail!.point))/10"
        distanceLabel.text = "\(String(describing: placeDetail!.distance))Km"
    }

}
