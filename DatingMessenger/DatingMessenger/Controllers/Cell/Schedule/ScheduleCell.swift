//
//  ScheduleCell.swift
//  DatingMessenger
//
//  Created by MBA0051 on 10/22/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class ScheduleCell: UICollectionViewCell {

    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var statusImageView: UIImageView!

    var viewModel: ScheduleCellViewModel? {
        didSet {
            if let viewModel = viewModel {
                self.hourLabel.text = viewModel.timeSchedule
                self.contentLabel.text = viewModel.contentSchedule
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
