//
//  CircleView.swift
//  AutoLayouts
//
//  Created by MBA0051 on 10/15/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class CircleView: UIView {
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(frame: CGRect, image: String) {
        super.init(frame: frame)
        self.mainImageView.image = UIImage(named: image)
        self.contentLabel.isHidden = true
        self.layer.cornerRadius = self.bounds.height / 2
    }
    
    init(frame: CGRect, content: String) {
        super.init(frame: frame)
        self.contentLabel.text = content
        self.mainImageView.isHidden = true
        self.layer.cornerRadius = self.bounds.height / 2
    }
}
