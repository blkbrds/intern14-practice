//
//  Bai4ViewController.swift
//  TouchEvent
//
//  Created by PCI0008 on 7/2/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

class Bai4ViewController: UIViewController {
    @IBOutlet private weak var appleImage: UIImageView!
    
    private var imageWidth: CGFloat = 0
    private var imageHeight: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pinchImage()
        rotationImage()
        longPress()
        
        imageWidth = appleImage.frame.width
        imageHeight = appleImage.frame.height
    }
    
    func pinchImage() {
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch))
        appleImage.addGestureRecognizer(pinch)
    }
    
    func rotationImage() {
        let rotation = UIRotationGestureRecognizer(target: self, action: #selector(handleRotation))
        appleImage.addGestureRecognizer(rotation)
    }
    
    func longPress() {
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        appleImage.addGestureRecognizer(longPress)
    }
    
    @objc private func handlePinch(_ sender: UIPinchGestureRecognizer) {
        guard sender.view != nil else { return }
        if sender.state == .began || sender.state == .changed {
            sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
            sender.scale = 1
        }
        
        if appleImage.frame.width <= imageWidth / 2 {
            appleImage.frame.size.width = imageWidth / 2
            appleImage.frame.size.height = imageHeight / 2
        } else if appleImage.frame.width >= imageWidth * 2 {
            appleImage.frame.size.width = imageWidth * 2
            appleImage.frame.size.height = imageHeight * 2
        }

        appleImage.center = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2)
    }
    
    @objc private func handleRotation(_ sender: UIRotationGestureRecognizer) {
        guard sender.view != nil else { return }
        if sender.state == .began || sender.state == .changed {
            sender.view?.transform = (sender.view!.transform.rotated(by: sender.rotation))
            sender.rotation = 0
        }
    }
    
    @objc private func handleLongPress(_ sender: UILongPressGestureRecognizer) {
        guard sender.view != nil else { return }
        sender.view?.transform = .identity
        appleImage.frame.size.width = imageWidth
        appleImage.frame.size.height = imageHeight
        appleImage.center = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2)
    }
}
