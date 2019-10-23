//
//  MessengerCollectionViewCell.swift
//  DatingMessenger
//
//  Created by MBA0051 on 10/19/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class MessengerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var statusImageView: UIImageView!
    @IBOutlet weak var viewedImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var messageContentLabel: UILabel!
    @IBOutlet weak var lastTimeLabel: UILabel!
    
    // Action when message has been set.
    var message: MessageCellViewModel? {
        didSet {
            if let message = message {
                if let avatar = message.profileImage {
                    CommonReusable.shared.createCircleImage(view: avatarImageView, named: avatar)
                }
                if let status = message.profileImage {
                    CommonReusable.shared.createCircleImage(view: statusImageView, named: status)
                }
                if let viewed = message.profileImage {
                    CommonReusable.shared.createCircleImage(view: viewedImageView, named: viewed)
                }
                usernameLabel.text = message.username
                messageContentLabel.text = message.messageText
                if let lastDate = message.messageLastTime {
                    let dateFormat = DateFormatter()
                    dateFormat.dateFormat = "h:mm a"
                    lastTimeLabel.text = dateFormat.string(from: lastDate as Date)
                }
            }
        }
    }
    //    weak var delegate: MessengerCollectionViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
