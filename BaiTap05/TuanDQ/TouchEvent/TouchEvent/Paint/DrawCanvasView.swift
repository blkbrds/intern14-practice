//
//  DrawCanvasView.swift
//  TouchEvent
//
//  Created by MBA0051 on 9/29/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class DrawCanvasView: UIView {

    fileprivate var lines = [LinePoint]()
    fileprivate var brushContext: CGContext? = nil
    fileprivate var strokeColor = UIColor.black

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        brushContext = UIGraphicsGetCurrentContext()
        
        // Draw line (in gragh)
//        let startPoint = CGPoint(x: 0, y: 0)
//        let endPoint = CGPoint(x: 100, y: 100)
//        context.move(to: startPoint)
//        context.addLine(to: endPoint)

        
        brushContext!.setLineWidth(10)
        
        
        lines.forEach{
            (line) in
            // Change color and type.
            brushContext!.setStrokeColor(line.color.cgColor)
            brushContext!.setLineCap(.round)

            // Write draw
            for (i, p) in line.points.enumerated() {
                if i == 0 {
                    brushContext!.move(to: p)
                } else {
                    brushContext!.addLine(to: p)
                }
            }
            // Setting change brush properties.
            brushContext!.strokePath()
        }
    }

    public func setStrokeColor(color brushColor: UIColor) {
        self.strokeColor = brushColor
    }
    
    var startXPoint: CGFloat = 0
    var startYPoint: CGFloat = 0
    public func settingCurrentPosition(point currentPoint: CGPoint) {
        startXPoint = currentPoint.x
        startYPoint = currentPoint.y
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append(LinePoint.init(color: strokeColor, points: []))
    }
    /**
     * Catch event when touch and move around canvas.
     * @author TuanDQ
     */
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else {
            return
        }
        
        guard var lastLine = lines.popLast() else {return}
        lastLine.points.append(CGPoint(x: point.x - startXPoint, y: point.y - startYPoint))
        lines.append(lastLine)
        setNeedsDisplay()
    }
    
    /**
     * Clear all brush point
     */
    func reset() {
        lines.removeAll()
        setNeedsDisplay()
    }
}
