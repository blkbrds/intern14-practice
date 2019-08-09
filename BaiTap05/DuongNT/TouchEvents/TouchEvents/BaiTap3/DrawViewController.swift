//
//  DrawViewController.swift
//  TouchEvents
//
//  Created by Nguyen Duong on 7/2/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class DrawViewController: UIViewController {

    @IBOutlet private weak var saveButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
    @IBOutlet private weak var greenButton: UIButton!
    @IBOutlet private weak var redButton: UIButton!
    @IBOutlet private weak var blueButton: UIButton!
    @IBOutlet private weak var yellowButton: UIButton!
    @IBOutlet private weak var purpleButton: UIButton!
    @IBOutlet private weak var orangeButton: UIButton!
    @IBOutlet private weak var whiteButton: UIButton!
    @IBOutlet private weak var tempImageView: UIImageView!

    var lastPoint = CGPoint.zero
    var color = UIColor.blue
    var brushWidth: CGFloat = 10.0
    var opacity: CGFloat = 1.0
    var swiped = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        saveButton.layer.cornerRadius = 8
        resetButton.layer.cornerRadius = 8
        greenButton.layer.cornerRadius = 23
        greenButton.layer.borderColor = UIColor(red: 0, green: 0, blue: 200, alpha: 1.0).cgColor
        greenButton.layer.borderWidth = 1
        redButton.layer.cornerRadius = 23
        redButton.layer.borderColor = UIColor(red: 0, green: 0, blue: 200, alpha: 1.0).cgColor
        redButton.layer.borderWidth = 1
        blueButton.layer.cornerRadius = 23
        blueButton.layer.borderColor = UIColor(red: 0, green: 0, blue: 200, alpha: 1.0).cgColor
        blueButton.layer.borderWidth = 1
        yellowButton.layer.cornerRadius = 23
        yellowButton.layer.borderColor = UIColor(red: 0, green: 0, blue: 200, alpha: 1.0).cgColor
        yellowButton.layer.borderWidth = 1
        purpleButton.layer.cornerRadius = 23
        purpleButton.layer.borderColor = UIColor(red: 0, green: 0, blue: 200, alpha: 1.0).cgColor
        purpleButton.layer.borderWidth = 1
        orangeButton.layer.cornerRadius = 23
        orangeButton.layer.borderColor = UIColor(red: 0, green: 0, blue: 200, alpha: 1.0).cgColor
        orangeButton.layer.borderWidth = 1
        whiteButton.layer.cornerRadius = 23
        whiteButton.layer.borderColor = UIColor(red: 0, green: 0, blue: 200, alpha: 1.0).cgColor
        whiteButton.layer.borderWidth = 1
        tempImageView.layer.cornerRadius = 20
        tempImageView.layer.borderColor = UIColor(red: 0, green: 0, blue: 200, alpha: 1.0).cgColor
        tempImageView.layer.borderWidth = 1
    }

    func drawLine(from fromPoint: CGPoint, to toPoint: CGPoint) {
        UIGraphicsBeginImageContext(view.frame.size)
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        tempImageView.image?.draw(in: view.bounds)
        context.move(to: fromPoint)
        context.addLine(to: toPoint)
        context.setLineCap(.round)
        context.setBlendMode(.normal)
        context.setLineWidth(brushWidth)
        context.setStrokeColor(color.cgColor)
        context.strokePath()
        tempImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        tempImageView.alpha = opacity
        UIGraphicsEndImageContext()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard let touch = touches.first else {
            return
        }
        swiped = false
        lastPoint = touch.location(in: view)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        guard let touch = touches.first else {
            return
        }
        swiped = false
        let currentPoint = touch.location(in: view)
        drawLine(from: lastPoint, to: currentPoint)
        lastPoint = currentPoint
    }

    @IBAction func pressColorTouchUpInside(_ sender: UIButton) {
        guard let colorButon = ColorButton(tag: sender.tag) else {
            return
        }
        color = colorButon.color
    }

    @IBAction func resetButtonTouchUpInside(_ sender: Any) {
         tempImageView.image = nil
    }

    @IBAction func saveButtonTouchUpInside(_ sender: Any) {
        guard let selectedImage = tempImageView.image else {
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
