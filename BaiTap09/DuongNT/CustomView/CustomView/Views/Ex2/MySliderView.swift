//
//  MySliderView.swift
//  CustomView
//
//  Created by Nguyen Duong on 7/18/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

protocol MySliderViewDelegate: class {
    func mySlider(_ mySlider: MySliderView, percent: Int)
}

class MySliderView: UIView {
    
    weak var delegate: MySliderViewDelegate?

    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var slidersView: UIView!
    @IBOutlet weak var rightSliderView: UIView!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var valueThumbnailView: UIView!
    @IBOutlet weak var valueThumbnaiLabel: UILabel!
    var valueOfThumbnai: CGFloat = 0.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: slidersView)
        if location.x >= 0.0 && location.x <= slidersView.frame.size.width {
            valueThumbnailView.frame.origin.x = location.x
            thumbnailImageView.frame.origin.x = location.x
            valueOfThumbnai = (location.x) * 100 / slidersView.frame.size.width
            valueThumbnaiLabel.text = "\(Int(valueOfThumbnai))%"
            delegate?.mySlider(self, percent: Int(valueOfThumbnai))
            rightSliderView.frame.size.width = location.x
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }
    
    func loadNib() {
        Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)
        addSubview(contentView)
    }
    
    func valueChanged(value: Float) {
        if value >= 0 && value <= 100 {
            let x = slidersView.frame.origin.x
            valueThumbnaiLabel.text = "\(Int(value))%"
            valueThumbnailView.center.x = x + (CGFloat(value)) * 2 + 8
            thumbnailImageView.center.x = x + (CGFloat(value)) * 2
            rightSliderView.frame.size.width = CGFloat(value) * 2
        } else if value < 0 {
            let x = slidersView.frame.origin.x
            valueThumbnaiLabel.text = "0%"
            valueThumbnailView.center.x = x + 8
            thumbnailImageView.center.x = x
            rightSliderView.frame.size.width = 0
        } else if value > 100 {
            let x = slidersView.frame.origin.x
            valueThumbnaiLabel.text = "100%"
            valueThumbnailView.center.x = x + 100 * 2 + 8
            thumbnailImageView.center.x = x + 100 * 2
            rightSliderView.frame.size.width = 100 * 2
        }
        
    }
}
