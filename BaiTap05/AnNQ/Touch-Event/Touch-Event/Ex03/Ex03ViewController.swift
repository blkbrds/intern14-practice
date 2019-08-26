//
//  Ex03ViewController.swift
//  Touch-Event
//
//  Created by MBA0217 on 8/23/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

class Ex03ViewController: UIViewController {

    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    @IBOutlet weak var drawView: UIImageView!
    var swiped = false
    var lastPoint = CGPoint.zero

    
    var lastColor = UIColor.blue.cgColor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTemplateView()
    }
    
    func updateTemplateView() {
        view.backgroundColor = .gray

        drawView.layer.borderColor = UIColor.black.cgColor
        drawView.layer.borderWidth = 2
        drawView.layer.cornerRadius = 50
        drawView.backgroundColor = .white

        saveButton.layer.cornerRadius = 10
        resetButton.layer.cornerRadius = 10

        greenButton.layer.cornerRadius = greenButton.bounds.width / 2
        redButton.layer.cornerRadius = redButton.bounds.width / 2
        blueButton.layer.cornerRadius = blueButton.bounds.width / 2
        yellowButton.layer.cornerRadius = yellowButton.bounds.width / 2
        purpleButton.layer.cornerRadius = purpleButton.bounds.width / 2
        orangeButton.layer.cornerRadius = orangeButton.bounds.width / 2

    }
    
    @IBAction func chooseColorTouchUpInside(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            lastColor = UIColor.green.cgColor
        case 2:
            lastColor = UIColor.red.cgColor
        case 3:
            lastColor = UIColor.yellow.cgColor
        case 4:
            lastColor = UIColor.purple.cgColor
        case 5:
            lastColor = UIColor.orange.cgColor
        default:
            lastColor = UIColor.blue.cgColor
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            lastPoint = touch.location(in: self.drawView)
        }
    }
    
    func drawLineFrom(fromPoint: CGPoint, toPoint: CGPoint) {
        
        // 1
        UIGraphicsBeginImageContext(self.drawView.frame.size)
        let context = UIGraphicsGetCurrentContext()
        drawView.image?.draw(in: CGRect(x: 0, y: 0, width: drawView.frame.size.width, height: drawView.frame.size.height))
        
        // 2
        context?.move(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
        context?.addLine(to: CGPoint(x: toPoint.x, y: toPoint.y))
        
        //3
        context?.setBlendMode(CGBlendMode.normal)
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(10.0)
        context?.setStrokeColor(lastColor)
        
        //4
        context?.strokePath()
        
        // 5
        drawView.image = UIGraphicsGetImageFromCurrentImageContext()
        drawView.alpha = 1.0
        UIGraphicsEndImageContext()
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 6
        swiped = true
        if let touch = touches.first {
            let currentPoint = touch.location(in: self.drawView)
            drawLineFrom(fromPoint: lastPoint, toPoint: currentPoint)
            
            // 7
            lastPoint = currentPoint
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !swiped {
            drawLineFrom(fromPoint: lastPoint, toPoint: lastPoint)
        }
    }
    
    @IBAction func saveButtonTouchUpInside(_ sender: UIButton) {
        guard let saveImage = drawView.image else {
            print("Image not found!")
            return
        }
        // saving image here
         UIImageWriteToSavedPhotosAlbum(saveImage, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    @IBAction func resetButtonTouchUpInside(_ sender: UIButton) {
        drawView.image = nil
    }
    
    //MARK: - Add image to Library
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            print(error.localizedDescription)
        } else {
            print("Saved")
        }
    }
}
