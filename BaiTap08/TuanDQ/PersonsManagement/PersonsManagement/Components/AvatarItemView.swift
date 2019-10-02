//
//  AvatarItemView.swift
//  Avatars
//
//  Created by MBA0051 on 9/30/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

protocol AvatarItemViewDelegate: class {
    func view(_ view: AvatarItemView, didSelect index: String?)
}

class AvatarItemView: UIView {

    @IBOutlet weak var personNameLabel: UILabel!
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var avatarButton: UIButton!
    fileprivate var avatarImage : UIImage?
    private var userId: String = ""
    
    weak var delegate: AvatarItemViewDelegate?
    
    @IBAction func avatarButtonClick(_ sender: Any) {
        delegate?.view(self, didSelect: userId)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    /**
     * Customize initial default.
     */
    func setting(person: PersonInfo) {
        self.personNameLabel?.text = person.personName
        self.personImageView?.image = person.personImage
        userId = person.userId
    }
}
