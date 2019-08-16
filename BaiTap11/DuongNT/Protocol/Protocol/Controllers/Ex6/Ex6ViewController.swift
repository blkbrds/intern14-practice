//
//  Ex6ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex6ViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet weak var screenImageView: UIImageView!

    // MARK: - Properties
    var exercise: Exercise?
    var lastPoint = CGPoint.zero
    var color = UIColor(red: CGFloat(100 / 255), green: CGFloat(100 / 255), blue: CGFloat(100 / 255), alpha: 1)
    var brushWidth: CGFloat = 10.0
    var swiped = false

    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Config
    override func setupUI() {
        super.setupUI()
        title = exercise?.name
    }

    // MARK: - Custom func
    private func drawLine(from fromPoint: CGPoint, to toPoint: CGPoint) {
        UIGraphicsBeginImageContext(screenImageView.frame.size)
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        screenImageView.image?.draw(in: screenImageView.bounds)
        context.move(to: fromPoint)
        context.addLine(to: toPoint)
        context.setLineCap(.round)
        context.setBlendMode(.normal)
        context.setLineWidth(brushWidth)
        context.setStrokeColor(color.cgColor)
        context.strokePath()
        screenImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        screenImageView.alpha = Config.opacity
        UIGraphicsEndImageContext()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard let touch = touches.first else {
            return
        }
        swiped = false
        lastPoint = touch.location(in: screenImageView)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        guard let touch = touches.first else {
            return
        }
        swiped = false
        let currentPoint = touch.location(in: screenImageView)
        drawLine(from: lastPoint, to: currentPoint)
        lastPoint = currentPoint
    }

    // MARK: - Actions
    @IBAction func saveButtonTouchUpInside(_ button: UIButton) {
        guard let selectedImage = screenImageView.image else {
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

    @IBAction func settingsButtonTouchUpInside(_ button: UIButton) {
        let vc = Ex6SettingsVC()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Extension
extension Ex6ViewController: Ex6SettingsDelegate {

    func resetValue(controller: Ex6SettingsVC, needPerformAction action: Ex6SettingsVC.Action, brushInfor: BrushInfor?) {
        switch action {
        case .updateSizeItem:
            if let brushInfor = brushInfor {
                self.color = UIColor(red: CGFloat(brushInfor.red / 255), green: CGFloat(brushInfor.green / 255), blue: CGFloat(brushInfor.blue / 255), alpha: 1)
                self.brushWidth = CGFloat(brushInfor.brushSize)
            }
        case .reset:
            screenImageView.image = nil
        }
    }
}

extension Ex6ViewController {

    struct Config {
        static let opacity: CGFloat = 1.0
    }
}
