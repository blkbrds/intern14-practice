//
//  ScheduleTableViewCell.swift
//  DatingMessenger
//
//  Created by MBA0051 on 10/22/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {

    @IBOutlet weak var timeScheduleLabel: UILabel!
    @IBOutlet weak var contentScheduleLabel: UILabel!
    @IBOutlet weak var statusUIImageView: UIImageView!
    
    var viewModel: ScheduleCellViewModel? {
        didSet {
            if let viewModel = viewModel {
                self.timeScheduleLabel.text = viewModel.timeSchedule
                self.contentScheduleLabel.text = viewModel.contentSchedule
            }
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
