//
//  BaiTap3.swift
//  BaiTapTouchEvent
//
//  Created by PCI0001 on 7/1/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class BaiTap3: UIViewController {
    @IBOutlet private weak var resetButton: UIButton!
    @IBOutlet private weak var backgroundImageView: UIImageView!
    
    let colorArray: [UIColor] = [UIColor.green, UIColor.red, UIColor.blue, UIColor.yellow, UIColor.purple, UIColor.orange, UIColor.white]
    var brushSize:CGFloat = 5.0
    var opacityValue:CGFloat = 1.0
    var lastPoint = CGPoint.zero
    var swiped = false
    var isDrawing = true
    var color: UIColor = .blue
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImageView.layer.cornerRadius = 30
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = false
        if let touch = touches.first {
            lastPoint = touch.location(in: self.backgroundImageView)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = true
        if let touch = touches.first {
            let currentPoint = touch.location(in: self.backgroundImageView)
            drawLines(fromPoint: lastPoint, toPoint: currentPoint)
            lastPoint = currentPoint
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !swiped {
            drawLines(fromPoint: lastPoint, toPoint: lastPoint)
        }
    }
    
    func drawLines(fromPoint: CGPoint, toPoint: CGPoint) {
    UIGraphicsBeginImageContext(self.backgroundImageView.frame.size)
        backgroundImageView.image?.draw(in: CGRect(x: 0, y: 0, width: self.backgroundImageView.frame.width, height: self.backgroundImageView.frame.height))
        let context = UIGraphicsGetCurrentContext()
        context?.move(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
        context?.addLine(to: CGPoint(x: toPoint.x, y: toPoint.y))
        context?.setBlendMode(CGBlendMode.normal)
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(brushSize)
        context?.setStrokeColor(color.cgColor)
        context?.strokePath()
        backgroundImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    @IBAction func resetButtonTouchUpInside(_ sender: UIButton) {
        self.backgroundImageView.image = nil
    }
    
    @IBAction func colorButtonTouchUpInside(_ sender: UIButton) {
        color = colorArray[sender.tag]
    }
    
}
