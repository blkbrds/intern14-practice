//
//  CustomDraw.swift
//  TouchEvent
//
//  Created by MBA0051 on 9/27/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class CustomDrawView : UIView {
    
    var drawColor = UIColor.black           // A color for drawing
    var lineWidth: CGFloat = 15             // A line width
    private var lastPoint: CGPoint!         // A point for storing the last position
    private var bezierPath: UIBezierPath!   // A bezier path
    private var pointCounter: Int = 0       // A counter of points
    private let pointLimit: Int = 128       // A limit of the points
    private var preRenderImage: UIImage!    // A pre-render image
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            guard let touch = touches.first else { return }
            lastPoint = touch.location(in: self)
            pointCounter = 0
        }
        
        override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
            guard let touch = touches.first else { return }
            let newPoint = touch.location(in: self)
            
            bezierPath.move(to: lastPoint)
            bezierPath.addLine(to: newPoint)
            lastPoint = newPoint
            
            pointCounter += 1
            
    //        if pointCounter == pointLimit {
    //            pointCounter = 0
    //            renderToImage()
    //            setNeedsDisplay()
    //            bezierPath.removeAllPoints()
    //        }
    //        else {
    //            setNeedsDisplay()
    //        }
        }
        
        override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            pointCounter = 0
        }
}

