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
        drawPropeties.swiped = false
        if let touch = touches.first {
            drawPropeties.lastPoint = touch.location(in: imageDrawView)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        drawPropeties.swiped = true
        if let touch = touches.first {
            let currentPoint = touch.location(in: imageDrawView)
            drawLines(fromPoint: drawPropeties.lastPoint, toPoint: currentPoint)
            drawPropeties.lastPoint = currentPoint
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !drawPropeties.swiped {
            drawLines(fromPoint: drawPropeties.lastPoint, toPoint: drawPropeties.lastPoint)
        }
    }
    
    private func drawLines(fromPoint: CGPoint, toPoint: CGPoint) {
        UIGraphicsBeginImageContext(imageDrawView.frame.size)
        imageDrawView.image?.draw(in: CGRect(x: 0, y: 0, width: imageDrawView.frame.width, height: imageDrawView.frame.height))
        let context = UIGraphicsGetCurrentContext()
        context?.move(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
        context?.addLine(to: CGPoint(x: toPoint.x, y: toPoint.y))
        context?.setBlendMode(CGBlendMode.normal)
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(drawPropeties.brushSize)
        context?.setStrokeColor(drawPropeties.drawColor.cgColor)
        context?.strokePath()
        imageDrawView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    private func alertError() {
        let alert = UIAlertController(title: "Save Error", message: "Image no found", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
    private func alertSuccess() {
        let alert = UIAlertController(title: "Save Image", message: "Save Success", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
    private func saveImage() {
        guard let selectedImage = imageDrawView.image else {
            alertError()
            return
        }
        UIImageWriteToSavedPhotosAlbum(selectedImage, self, #selector(checkSave(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    @objc private func checkSave(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if error != nil {
            alertError()
        } else {
            alertSuccess()
        }
    }
    
    @objc private func saveButtonDidClick() {
        saveImage()
    }
    
    @objc private func settingsButtonDidClick() {
        let vc = SettingsViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: Delegate
extension Ex6ViewController: SettingsViewControllerDelegate {    
    func settingView(_ view: SettingsViewController, needPerformAction action: SettingsViewController.Action, color: UIColor?) {
        switch action {
        case .getColor:
            guard let colorPaint = color else { return }
            drawPropeties.drawColor = colorPaint
        case .clearImage:
            imageDrawView.image = nil
        }
    }
    
    func settingView(_ view: SettingsViewController, brushSize: CGFloat?) {
        guard let brush = brushSize else { return }
        drawPropeties.brushSize = brush
    }
}

//MARK: Propeties
extension Ex6ViewController {
    struct drawPropeties {
        static var drawColor: UIColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        static var brushSize: CGFloat = 5
        static var lastPoint = CGPoint.zero
        static var swiped = false
    }
}
