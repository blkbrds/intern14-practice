//
//  Ex03ViewController.swift
//  Baitap_touch_event
//
//  Created by PCI0013 on 7/1/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

class Ex03ViewController: UIViewController {
    
    @IBOutlet private weak var whiteButton: UIButton!
    @IBOutlet private weak var greenButton: UIButton!
    @IBOutlet private weak var redButton: UIButton!
    @IBOutlet private weak var blueButton: UIButton!
    @IBOutlet private weak var yellowButton: UIButton!
    @IBOutlet private weak var violetButton: UIButton!
    @IBOutlet private weak var orangeButton: UIButton!
    @IBOutlet private weak var saveButton: UIButton!
    @IBOutlet private weak var clearButton: UIButton!
    @IBOutlet private weak var drawImageView: UIImageView!
        
    var lastPoint = CGPoint.zero
    var swiped = false
    var opacity: CGFloat = 1.0
    var brushWidth: CGFloat = 10.0
    var color = UIColor.blue.cgColor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    func configUI() {
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = false
        if let touch = touches.first {
            lastPoint = touch.location(in: drawImageView)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = false
        if let touch = touches.first {
            let currentPoint = touch.location(in: drawImageView)
            drawLineFrom(fromPoint: lastPoint, toPoint: currentPoint)
            lastPoint = currentPoint
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
        context?.strokePath()
        
        drawImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        drawImageView.alpha = opacity
        UIGraphicsEndImageContext()
        
    }
        
    func saveImage() {
        guard let selectedImage = drawImageView.image else {
            print("Image not found!")
            return
        }
        UIImageWriteToSavedPhotosAlbum(selectedImage, self, #selector(handleSaveImage(_:didFinishSavingWithError:contextInfo:)), nil)
    }
        
    @objc func handleSaveImage(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            print(error.localizedDescription)
        } else {
            print("Saved")
        }
    }
    
    @IBAction private func saveImageButtonTouchUpInside(_ sender: Any) {
        saveImage()
    }
        
    @IBAction private func clearImage(_ sender: Any) {
        drawImageView.image = nil
    }
    
    @IBAction private func greenTouchUpInside(_ sender: Any) {
        color = UIColor.green.cgColor
    }
    
    @IBAction private func redTouchUpInside(_ sender: Any) {
        color = UIColor.red.cgColor
    }
    
    @IBAction private func blueTouchUpInside(_ sender: Any) {
        color = UIColor(red: 100 / 255, green: 200 / 255, blue: 255 / 255, alpha: 1.0).cgColor
    }
    
    @IBAction private func yellowTouchUpInside(_ sender: Any) {
        color = UIColor.yellow.cgColor
    }
    
    @IBAction private func violetTouchUpInside(_ sender: Any) {
        color = UIColor.purple.cgColor
    }
    
    @IBAction private func orangeTouchUpInside(_ sender: Any) {
        color = UIColor.orange.cgColor
    }
    
    @IBAction private func whiteTouchUpInside(_ sender: Any) {
        color = UIColor.white.cgColor
    }
}
