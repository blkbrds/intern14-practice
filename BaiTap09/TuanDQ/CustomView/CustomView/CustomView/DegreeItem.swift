//
//  DegreeItem.swift
//  CustomView
//
//  Created by MBA0051 on 10/2/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class DegreeItem: ParentView {

    var bubbleColor: UIColor = .red {
           didSet {
               setNeedsDisplay()
           }
       }
    private var degreeValueLabel: UILabel = UILabel()
    
    /**
     * Reference inheritent solution.
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        loadViewFromNib()
    }

    // OLD Solution
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
////        let _ = loadViewFromLib()
//        backgroundColor = .clear
//    }
    
    func loadViewFromNib() {
//        let bundle = Bundle.init(for: type(of: self))
//        let nib = UINib(nibName: "DegreeItem", bundle: bundle)
//        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
//        view.frame = bounds
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.backgroundColor = .clear

        degreeValueLabel.frame = self.bounds
        degreeValueLabel.textAlignment = .center
        degreeValueLabel.font = UIFont.boldSystemFont(ofSize: 20)
        degreeValueLabel.frame.size.height = 3 * self.bounds.size.height / 4
        degreeValueLabel.textColor = .white
        addSubview(degreeValueLabel)
    }
    
    override func draw(_ rect: CGRect) {
            self.createRectangle()
    }

    func createRectangle() {
        let kArrowHeight: CGFloat = self.bounds.size.height / 4
        // Initialize the path.
        let path = UIBezierPath()

        path.move(to: CGPoint(x: 0.0, y: 0.0))
        path.addLine(to: CGPoint(x: self.bounds.size.width, y: 0))
        path.addLine(to: CGPoint(x: self.bounds.size.width, y: self.bounds.size.height - kArrowHeight))
        path.addLine(to: CGPoint(x: self.bounds.size.width/2+(kArrowHeight/2), y: self.bounds.size.height - kArrowHeight))
        path.addLine(to: CGPoint(x: self.bounds.size.width/2, y: self.bounds.size.height))
        path.addLine(to: CGPoint(x: self.bounds.size.width/2-(kArrowHeight/2), y: self.bounds.size.height - kArrowHeight))
        path.addLine(to: CGPoint(x: 0, y: self.bounds.size.height - kArrowHeight))

        // Close the path. This will create the last line automatically.
        path.close()
        bubbleColor.setFill()
        path.fill()
    }
    
    func changeDegreeValue(value sliderValue: Float) {
        degreeValueLabel.text = String(Int(sliderValue * 100)) + "%"
    }
}
