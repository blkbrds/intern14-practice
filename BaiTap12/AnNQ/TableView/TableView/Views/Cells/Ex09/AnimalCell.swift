//
//  AnimalCell.swift
//  TableView
//
//  Created by MBA0217 on 10/10/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

protocol AnimalCellDelegate: class {
    func animalCell(cell: AnimalCell, needsPerform action: AnimalCell.Action)
}
class AnimalCell: UITableViewCell {

    enum Action {
        case didSelectName
    }
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconButton: UIButton!
    weak var delegate: AnimalCellDelegate?
    var checkStatus: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func buttonTouchUpInside(_ sender: UIButton) {
        if let delegate = self.delegate {
            checkStatus = !checkStatus
            delegate.animalCell(cell: self, needsPerform: .didSelectName)
        }
    }
    
}
