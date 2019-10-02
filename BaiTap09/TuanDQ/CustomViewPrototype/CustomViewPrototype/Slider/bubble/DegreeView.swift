//
//  DegreeView.swift
//  CustomViewPrototype
//
//  Created by MBA0051 on 10/2/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class DegreeView: UIView {

    var path: UIBezierPath!
    var bubbleColor: UIColor = .green {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBOutlet weak var degreeLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
//        self.createRectangle()
//        degreeLabel.frame = CGRect
    }

    func createRectangle() {
        let kArrowHeight: CGFloat = self.bounds.size.height / 4
        // Initialize the path.
        path = UIBezierPath()

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
    

}
