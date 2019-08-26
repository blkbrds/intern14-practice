//
//  HomeCell.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

protocol HomeCellDelegate: class {
    func homeCellView(_ viewCell: HomeCell)
}

class HomeCell: UITableViewCell {
    
    weak var delegate: HomeCellDelegate?
    
    //MARK: Outlet
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var ratingButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func ratingButtonTouchUpInside(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.homeCellView(self)
        }
    }
}
