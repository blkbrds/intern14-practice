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
    
    // MARK: - outlet

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var slidersView: UIView!
    @IBOutlet weak var rightSliderView: UIView!
    @IBOutlet weak var thumbnailView: UIView!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var valueThumbnailView: UIView!
    @IBOutlet weak var valueThumbnaiLabel: UILabel!
    
    // MARK: - properties
    
    var valueOfThumbnai: CGFloat = 0.0
    weak var delegate: MySliderViewDelegate?
    
    // MARK: - lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: slidersView)
        if location.x >= 0.0 && location.x <= slidersView.frame.size.width {
            valueThumbnailView.frame.origin.x = location.x
            thumbnailImageView.frame.origin.x = location.x
            rightSliderView.frame.size.width = location.x
            valueOfThumbnai = (location.x) * 100 / slidersView.frame.size.width
            valueThumbnaiLabel.text = "\(Int(valueOfThumbnai))%"
            delegate?.mySlider(self, percent: Int(valueOfThumbnai))
        }
    }
    
    // MARK: - custom func
    
    func loadNib() {
        Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)
        addSubview(thumbnailView)
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
