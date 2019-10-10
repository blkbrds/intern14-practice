//
//  Ex09TableViewCell.swift
//  TableView
//
//  Created by MBA0217 on 10/9/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

protocol Ex09TableViewCellDelegate: class {
    func callMe(_ ex09TableViewCell: Ex09TableViewCell)
}

class Ex09TableViewCell: UITableViewCell {

    weak var delegate: Ex09TableViewCellDelegate?
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let callButton = UIButton(frame: CGRect(x: 350, y: 0, width: 50, height: 50))
        callButton.setImage(UIImage(named: "call_button"), for: .normal)
        callButton.addTarget(self, action: #selector(callMe), for: .touchUpInside)
        addSubview(callButton)
    }
    
    @objc func callMe() {
        delegate?.callMe(self)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
