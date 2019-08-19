//
//  MonkeyViewController.swift
//  ExTouchEvent
//
//  Created by PCI0010 on 8/16/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class MonkeyViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var rotation = UIRotationGestureRecognizer()
    var pinch = UIPinchGestureRecognizer()
    var holdPress = UILongPressGestureRecognizer()
    let myMonkey = UIImage(imageLiteralResourceName: "monkey.png")
    
    @IBOutlet weak var monkeyLabel: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    @objc func handleRotation(_ sender: UIRotationGestureRecognizer) {
        guard sender.view != nil else { return }
        if sender.state == .began || sender.state == .changed {
            sender.view?.transform = sender.view!.transform.rotated(by: sender.rotation)
            sender.rotation = 0
        }
    }
    
    @objc func pinchGes(_ sender: UIPinchGestureRecognizer) {
        guard sender.view != nil else { return }
        if sender.state == .began || sender.state == .changed {
            sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
            sender.scale = 1.0
        }
    }
    
    @objc func longPress(_ sender: UILongPressGestureRecognizer) {
        guard sender.view != nil else { return }
        if sender.state == .began || sender.state == .changed {
            self.monkeyLabel.transform = .identity
        }
    }
    
    func configUI() {
        title = "Monkey"
        navigationController?.navigationBar.backgroundColor = .cyan
        monkeyLabel.image = myMonkey
        rotation.delegate = self
        pinch.delegate = self
        holdPress.delegate = self
        rotation = UIRotationGestureRecognizer(target: self, action: #selector(handleRotation))
        pinch = UIPinchGestureRecognizer(target: self, action: #selector(pinchGes))
        holdPress = UILongPressGestureRecognizer(target: self, action: #selector(longPress(_:)))
        holdPress.minimumPressDuration = 5
        monkeyLabel.addGestureRecognizer(rotation)
        monkeyLabel.addGestureRecognizer(pinch)
        monkeyLabel.addGestureRecognizer(holdPress)
    }
    
}
