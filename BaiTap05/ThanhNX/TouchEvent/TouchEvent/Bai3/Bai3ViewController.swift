//
//  Bai3ViewController.swift
//  TouchEvent
//
//  Created by PCI0008 on 6/28/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

class Bai3ViewController: UIViewController {
    private let colorArr: [UIColor] = [UIColor.red, UIColor.green, UIColor.blue, UIColor.yellow, UIColor.orange, UIColor.brown, UIColor.black, UIColor.purple, UIColor.white]
    
    private var drawColor: UIColor = .blue
    private var brushSize: CGFloat = 5
    private var lastPoint = CGPoint.zero
    private var swiped = false
    
    @IBOutlet private weak var saveButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var redButton: UIButton!
    @IBOutlet private weak var greenButton: UIButton!
    @IBOutlet private weak var blueButton: UIButton!
    @IBOutlet private weak var yellowButton: UIButton!
    @IBOutlet private weak var orangeButton: UIButton!
    @IBOutlet private weak var brownButton: UIButton!
    @IBOutlet private weak var blackButton: UIButton!
    @IBOutlet private weak var purpleButton: UIButton!
    @IBOutlet private weak var whiteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        paintExercise()
    }
    
    func paintExercise() {
        saveButton.layer.cornerRadius = 20
        resetButton.layer.cornerRadius = 20
        imageView.layer.cornerRadius = 40
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = #colorLiteral(red: 0.3698388925, green: 0.07475966976, blue: 0.1861478937, alpha: 1)
        redButton.layer.cornerRadius = redButton.bounds.height / 2
        greenButton.layer.cornerRadius = greenButton.bounds.height / 2
        blueButton.layer.cornerRadius = blueButton.bounds.height / 2
        yellowButton.layer.cornerRadius = yellowButton.bounds.height / 2
        orangeButton.layer.cornerRadius = orangeButton.bounds.height / 2
        brownButton.layer.cornerRadius = brownButton.bounds.height / 2
        blackButton.layer.cornerRadius = blackButton.bounds.height / 2
        purpleButton.layer.cornerRadius = purpleButton.bounds.height / 2
        whiteButton.layer.cornerRadius = whiteButton.bounds.height / 2
    }
    
    @IBAction private func saveTouchUpInside(_ sender: UIButton) {
    }
    
    //MARK: reseting
    
    @IBAction private func resetTouchUpInside(_ sender: UIButton) {
        imageView.image = nil
    }
    
    @IBAction private func redTouchUpInside(_ sender: UIButton) {
        drawColor = colorArr[sender.tag]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = false
        if let touch = touches.first {
            lastPoint = touch.location(in: imageView)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = true
        if let touch = touches.first {
            let currentPoint = touch.location(in: imageView)
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
        UIGraphicsBeginImageContext(imageView.frame.size)
        imageView.image?.draw(in: CGRect(x: 0, y: 0, width: imageView.frame.width, height: imageView.frame.height))
        let context = UIGraphicsGetCurrentContext()
        context?.move(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
        context?.addLine(to: CGPoint(x: toPoint.x, y: toPoint.y))
        context?.setBlendMode(CGBlendMode.normal)
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(brushSize)
        context?.setStrokeColor(drawColor.cgColor)
        context?.strokePath()
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
}
