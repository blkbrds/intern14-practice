//
//  Ex6ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex6ViewController: BaseViewController {
    
    @IBOutlet private weak var imageDrawView: UIImageView!
    
    private var drawColor: UIColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
    private var brushSize: CGFloat = 5
    private var lastPoint = CGPoint.zero
    private var swiped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = "Paint"
        let saveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveButtonDidClick))
        navigationItem.leftBarButtonItem = saveButton
        
        let settingsButton = UIBarButtonItem(title: "Setting", style: .plain, target: self, action: #selector(settingsButtonDidClick))
        navigationItem.rightBarButtonItem = settingsButton
        imageDrawView.layer.borderColor = UIColor.black.cgColor
        imageDrawView.layer.borderWidth = 1
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = false
        if let touch = touches.first {
            lastPoint = touch.location(in: imageDrawView)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        swiped = true
        if let touch = touches.first {
            let currentPoint = touch.location(in: imageDrawView)
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
        UIGraphicsBeginImageContext(imageDrawView.frame.size)
        imageDrawView.image?.draw(in: CGRect(x: 0, y: 0, width: imageDrawView.frame.width, height: imageDrawView.frame.height))
        let context = UIGraphicsGetCurrentContext()
        context?.move(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
        context?.addLine(to: CGPoint(x: toPoint.x, y: toPoint.y))
        context?.setBlendMode(CGBlendMode.normal)
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(brushSize)
        context?.setStrokeColor(drawColor.cgColor)
        context?.strokePath()
        imageDrawView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    func saveImage() {
        guard let selectedImage = imageDrawView.image else {
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
    
    @objc func saveButtonDidClick() {
        saveImage()
    }
    
    @objc func settingsButtonDidClick() {
        let vc = SettingsViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: Delegate
extension Ex6ViewController: SettingsViewControllerDelegate {
    func settingView(_ view: SettingsViewController, image: UIImageView?) {
        guard let clearImage = image else { return }
        imageDrawView.image = clearImage.image
    }
    
    func settingView(_ view: SettingsViewController, needPerformAction action: SettingsViewController.Action, color: UIColor?) {
        switch action {
        case .getColor:
            guard let colorPaint = color else { return }
            drawColor = colorPaint
        case .clearImage:
            imageDrawView.image = nil
        }
    }
    
    func settingView(_ view: SettingsViewController, brushSize: CGFloat?) {
        guard let brush = brushSize else { return }
        self.brushSize = brush
    }
}
