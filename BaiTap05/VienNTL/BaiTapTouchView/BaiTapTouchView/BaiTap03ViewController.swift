//
//  BaiTap03ViewController.swift
//  BaiTapTouchView
//
//  Created by Nguyen Truong Lam Vien on 7/2/19.
//  Copyright © 2019 Nguyen Truong Lam Vien. All rights reserved.
//

import UIKit

class BaiTap03ViewController: UIViewController {
    @IBOutlet private weak var drawView: UIView!
    @IBOutlet private weak var saveButtonTouchUpInside: UIButton!
    @IBOutlet private weak var clearButtonTouchUpInside: UIButton!
    @IBOutlet private weak var redColorButtonTouchUpInside: UIButton!
    @IBOutlet private weak var yellowColorButtonTouchUpInside: UIButton!
    @IBOutlet private weak var greenColorButtonTouchUpInside: UIButton!
    @IBOutlet private weak var blueColorButtonTouchUpInside: UIButton!
    @IBOutlet private weak var pinkColorButtonTouchUpInside: UIButton!
    @IBOutlet private weak var orangeColorButtonTouchUpInside: UIButton!
    @IBOutlet private weak var whiteBlueColorButtonTouchUpInside: UIButton!
    @IBOutlet private weak var purpleColorButtonTouchUpInside: UIButton!
    @IBOutlet weak var blackColorButtonTouchUpInside: UIButton!
    
    private var startPoint = CGPoint(x: 0, y: 0)
    private var endPoint = CGPoint(x: 0, y: 0)
    private var newImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designUI()
        drawView.clipsToBounds = true
    }
    
    private func designUI() {
        drawView.layer.borderWidth = 0.2
        drawView.layer.borderColor = UIColor.black.cgColor
        drawView.layer.cornerRadius = 8
        
        saveButtonTouchUpInside.layer.cornerRadius = 8
        clearButtonTouchUpInside.layer.cornerRadius = 8
        
        redColorButtonTouchUpInside.layer.cornerRadius = 15
        yellowColorButtonTouchUpInside.layer.cornerRadius = 15
        greenColorButtonTouchUpInside.layer.cornerRadius = 15
        blueColorButtonTouchUpInside.layer.cornerRadius = 15
        pinkColorButtonTouchUpInside.layer.cornerRadius = 15
        orangeColorButtonTouchUpInside.layer.cornerRadius = 15
        whiteBlueColorButtonTouchUpInside.layer.cornerRadius = 15
        purpleColorButtonTouchUpInside.layer.cornerRadius = 15
        blackColorButtonTouchUpInside.layer.cornerRadius = 15
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: drawView)
            startPoint = location
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        if let touch = touches.first {
            let location = touch.location(in: drawView)
            endPoint = location
            
            let path = UIBezierPath()
            path.move(to: startPoint)
            path.addLine(to: endPoint)
            startPoint = endPoint
            
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = path.cgPath
            shapeLayer.strokeColor = UIColor.black.cgColor
            
            drawView.layer.addSublayer(shapeLayer)
            }
    }
    @IBAction func clearButtonTouchUpInside(_ sender: Any) {
        if let drawView = drawView {
            drawView.layer.sublayers?.removeAll()
        }
    }
    
    @IBAction func saveButtonTouchUpInside(_ sender: Any) {
        let renderer = UIGraphicsImageRenderer(size: view.bounds.size)
        newImage = renderer.image { ctx in view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        }
    }

}

