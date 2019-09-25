//
//  PaintViewController.swift
//  ExTouchEvent
//
//  Created by PCI0010 on 8/16/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class PaintViewController: UIViewController {
    
    var lastPoint = CGPoint.zero
    var color = UIColor.blue
    var brushWidth: CGFloat = 10.0
    var opacity: CGFloat = 1.0
    var swiped = false
    
    //Mark: - Outlet
    @IBOutlet var allButton: [UIButton]!
    @IBOutlet weak var mainImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    //Mark: - Action
    @IBAction func saveButton(_ sender: Any) {
    }
    
    @IBAction func colorPress(_ sender: UIButton) {
        guard let colors = Colors(tag: sender.tag) else { return }
        self.color = colors.color
    }
    
    @IBAction func resetButton(_ sender: Any) {
        mainImageView.image = nil
    }
    
    //Mark: - Function
    func configUI() {
        title = "Paint Color"
        navigationController?.navigationBar.backgroundColor = .cyan
        mainImageView.layer.cornerRadius = 40
        mainImageView.layer.borderWidth = 1
        mainImageView.layer.borderColor = UIColor.black.cgColor
        mainImageView.backgroundColor = .white
        for button in allButton{
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.cornerRadius = 15
        }
    }
    
    func drawLine(from fromPoint: CGPoint, to toPoint: CGPoint) {
        UIGraphicsBeginImageContext(mainImageView.frame.size)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        mainImageView.image?.draw(in: mainImageView.bounds)
        context.move(to: fromPoint)
        context.addLine(to: toPoint)
        context.setLineCap(.round)
        context.setBlendMode(.normal)
        context.setLineWidth(brushWidth)
        context.setStrokeColor(color.cgColor)
        context.strokePath()
        mainImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        mainImageView.alpha = opacity
        UIGraphicsEndImageContext()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        swiped = false
        lastPoint = touch.location(in: mainImageView)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        swiped = true
        let currentPoint = touch.location(in: mainImageView)
        drawLine(from: lastPoint, to: currentPoint)
        lastPoint = currentPoint
        
    }
}


