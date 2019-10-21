//
//  CustomCellTableViewCell.swift
//  TableView
//
//  Created by MBA0051 on 10/16/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

protocol CustomCellTableViewCellDelegate: class {
    func tapButtonClick(view: CustomCellTableViewCell)
}
class CustomCellTableViewCell: UITableViewCell {
    @IBOutlet weak var userName: UILabel!
    var indexPath: IndexPath?
    weak var delegate: CustomCellTableViewCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func tapMeButtonClick(_ sender: UIButton) {
        delegate?.tapButtonClick(view: self)
    }
}
