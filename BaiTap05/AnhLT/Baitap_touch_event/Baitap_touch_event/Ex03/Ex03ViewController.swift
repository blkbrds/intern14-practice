//
//  Ex03ViewController.swift
//  Baitap_touch_event
//
//  Created by PCI0013 on 7/1/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit
    var lastPoint = CGPoint.zero
    var swiped = false
    var opacity: CGFloat = 1.0
    var brushWidth: CGFloat = 10.0
    var color = UIColor.blue.cgColor

    class Ex03ViewController: UIViewController {

    @IBOutlet weak var whiteButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var violetButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var drawImageView: UIImageView!
        override func viewDidLoad() {
        super.viewDidLoad()
        design()
    }
    func design() {
        whiteButton.layer.cornerRadius = 13
        whiteButton.layer.borderWidth = 1
        greenButton.layer.cornerRadius = 13
        greenButton.layer.borderWidth = 1
        redButton.layer.cornerRadius = 13
        redButton.layer.borderWidth = 1
        blueButton.layer.cornerRadius = 13
        blueButton.layer.borderWidth = 1
        yellowButton.layer.cornerRadius = 13
        yellowButton.layer.borderWidth = 1
        violetButton.layer.cornerRadius = 13
        violetButton.layer.borderWidth = 1
        orangeButton.layer.cornerRadius = 13
        orangeButton.layer.borderWidth = 1
        
        drawImageView.layer.cornerRadius = 10
        drawImageView.layer.borderWidth = 1
        
        clearButton.layer.cornerRadius = 5
        clearButton.layer.borderWidth = 1
        
        saveButton.layer.cornerRadius = 5
        saveButton.layer.borderWidth = 1
    }
    
        @IBAction func saveImage(_ sender: Any) {
            saveImage()
        }
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = false
        if let touch = touches.first {
            lastPoint = touch.location(in: drawImageView)
        }
    }
        func drawLineFrom(fromPoint: CGPoint, toPoint: CGPoint) {
            UIGraphicsBeginImageContext(drawImageView.frame.size)
            let context = UIGraphicsGetCurrentContext()
            drawImageView.image?.draw(in: CGRect(x: 0, y: 0, width: drawImageView.frame.size.width, height: drawImageView.frame.size.height))
            context?.move(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
            context?.addLine(to: CGPoint(x: toPoint.x, y: toPoint.y))
            context?.setBlendMode(CGBlendMode.normal)
            context?.setLineCap(CGLineCap.round)
            context?.setLineWidth(brushWidth)
            context?.setStrokeColor(color)
//            context?.setStrokeColor(UIColor(red: red, green: green, blue: blue, alpha: opacity).cgColor)
            context?.strokePath()
            
            drawImageView.image = UIGraphicsGetImageFromCurrentImageContext()
            drawImageView.alpha = opacity
            UIGraphicsEndImageContext()
            
        }
        
        override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
            swiped = false
            if let touch = touches.first {
                let currentPoint = touch.location(in: drawImageView)
                drawLineFrom(fromPoint: lastPoint, toPoint: currentPoint)
                
                lastPoint = currentPoint
            }
        }
        
        func saveImage() {
            guard let selectedImage = drawImageView.image else {
                print("Image not found!")
                return
            }
            UIImageWriteToSavedPhotosAlbum(selectedImage, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
        }
        
        @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Saved")
            }
        }
        
        @IBAction func clearImage(_ sender: Any) {
            drawImageView.image = nil
        }
        
        @IBAction func greenTouchUpInside(_ sender: Any) {
            color = UIColor.green.cgColor
        }
        @IBAction func redTouchUpInside(_ sender: Any) {
            color = UIColor.red.cgColor
        }
        @IBAction func blueTouchUpInside(_ sender: Any) {
            color = UIColor(red: 100 / 255, green: 200 / 255, blue: 255 / 255, alpha: 1.0).cgColor
        }
        @IBAction func yellowTouchUpInside(_ sender: Any) {
            color = UIColor.yellow.cgColor
        }
        @IBAction func violetTouchUpInside(_ sender: Any) {
            color = UIColor.purple.cgColor
        }
        @IBAction func orangeTouchUpInside(_ sender: Any) {
            color = UIColor.orange.cgColor
        }
        @IBAction func whiteTouchUpInside(_ sender: Any) {
            color = UIColor.white.cgColor
        }
}

