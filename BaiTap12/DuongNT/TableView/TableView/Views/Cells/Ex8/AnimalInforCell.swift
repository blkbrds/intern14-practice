//
//  AnimalInforCell.swift
//  TableView
//
//  Created by Nguyen Duong on 8/16/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

class AnimalInforCell: UITableViewCell {

    @IBOutlet weak var animalImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptLabel: UILabel!

    var animal: Animal? {
        didSet {
            loadData()
        }
    }

    func loadData() {
        guard let animal = animal else {
            return
        }
        animalImageView.image = UIImage(named: animal.avatar)
        nameLabel.text = animal.name
        descriptLabel.text = animal.descript
    }
}
