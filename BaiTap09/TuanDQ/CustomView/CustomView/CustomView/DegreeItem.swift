//
//  DegreeItem.swift
//  CustomView
//
//  Created by MBA0051 on 10/2/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class DegreeItem: UIView {

    var bubbleColor: UIColor = .green {
           didSet {
               setNeedsDisplay()
           }
       }
    var degreeValueLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        let _ = loadViewFromLib()
        backgroundColor = .clear
    }
    
    func loadViewFromLib() -> UIView {
        let bundle = Bundle.init(for: type(of: self))
        let nib = UINib(nibName: "DegreeItem", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.backgroundColor = .clear
        
        let degreeValue = UILabel(frame: self.bounds)
        degreeValue.text = "Test value"
        degreeValue.textAlignment = .center
        degreeValue.frame.size.height = 3 * self.bounds.size.height / 4
        degreeValue.textColor = .white
        
        degreeValueLabel = degreeValue
        view.addSubview(degreeValueLabel)
        addSubview(view)
        
        return view
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

    private var min: Float = 0.0
    private var max: Float = 0.0
    private var degreeLocation: CGRect = .zero
    func setting(sliderPosition: CGRect) {
//        min = minX
//        max = maxX
        degreeLocation = sliderPosition
    }
    
    func changeDegreeValue(value sliderValue: Float) {
        let percent = Int(sliderValue * 100)
        degreeValueLabel.text = String(percent)
        
        // Setting value.
        self.center.y = CGFloat((max - min) * sliderValue)
    }
}
