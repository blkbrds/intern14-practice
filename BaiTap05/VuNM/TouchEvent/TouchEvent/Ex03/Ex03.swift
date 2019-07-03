//
//  Ex03.swift
//  TouchEvent
//
//  Created by PCI0007 on 7/1/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

class Ex03: UIViewController {

    @IBOutlet weak var drawBoardView: UIImageView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    @IBOutlet weak var whiteButton: UIButton!
    var color = UIColor.blue.cgColor
    var startPoint: CGPoint = CGPoint(x: 0, y: 0)
    var nextPoint: CGPoint = CGPoint(x: 0, y: 0)
    var path = UIBezierPath()
    var lineLayer = CAShapeLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        drawBoardView.clipsToBounds = true
        adjustButton()
    }

    func adjustButton() {
        drawBoardView.layer.borderWidth = 1
        drawBoardView.layer.borderColor = UIColor.black.cgColor
        orangeButton.backgroundColor = .orange
        yellowButton.backgroundColor = .yellow
        greenButton.backgroundColor = .green
        redButton.backgroundColor = .red
        blueButton.backgroundColor = .blue
        purpleButton.backgroundColor = .purple
        whiteButton.backgroundColor = .white
        drawBoardView.backgroundColor = .black
        drawBoardView.layer.borderWidth = 1
        drawBoardView.layer.borderColor = UIColor.magenta.cgColor
        redButton.layer.borderWidth = 1
        redButton.layer.borderColor = UIColor.magenta.cgColor
        yellowButton.layer.borderWidth = 1
        yellowButton.layer.borderColor = UIColor.magenta.cgColor
        purpleButton.layer.borderWidth = 1
        purpleButton.layer.borderColor = UIColor.magenta.cgColor
        greenButton.layer.borderWidth = 1
        greenButton.layer.borderColor = UIColor.magenta.cgColor
        whiteButton.layer.borderWidth = 1
        whiteButton.layer.borderColor = UIColor.magenta.cgColor
        orangeButton.layer.borderWidth = 1
        orangeButton.layer.borderColor = UIColor.magenta.cgColor
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            startPoint = touch.location(in: drawBoardView)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            nextPoint = touch.location(in: drawBoardView)
            path = UIBezierPath()
            path.move(to: startPoint)
            path.addLine(to: nextPoint)
            startPoint = nextPoint
            lineLayer = CAShapeLayer()
            lineLayer.path = path.cgPath
            lineLayer.strokeColor = color
            lineLayer.lineWidth = 2
            drawBoardView.layer.addSublayer(lineLayer)
        }
    }

    @IBAction func clearButton(_ sender: UIButton) {
        if let draw = drawBoardView {
            draw.layer.sublayers?.removeAll()
        } 
    }
    
    @IBAction func yellowButton(_ sender: UIButton) {
        color = UIColor.yellow.cgColor
    }
    
    @IBAction func purpleButton(_ sender: Any) {
        color = UIColor.purple.cgColor
    }
    
    @IBAction func orangeButton(_ sender: Any) {
        color = UIColor.orange.cgColor
    }
    
    @IBAction func whiteButton(_ sender: Any) {
        color = UIColor.white.cgColor
    }
    
    @IBAction func greenButton(_ sender: Any) {
        color = UIColor.green.cgColor
    }
    
    @IBAction func blueButton(_ sender: Any) {
        color = UIColor.blue.cgColor
    }
    
    @IBAction func redButton(_ sender: Any) {
        color = UIColor.red.cgColor
    }
    @IBAction func saveButton(_ sender: Any) {
        saveImage()
    }
    func saveImage() {
        guard let selectedImage = drawBoardView.image else {
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
}
