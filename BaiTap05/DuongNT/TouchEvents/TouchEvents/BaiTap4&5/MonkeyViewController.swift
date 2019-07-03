//
//  MonkeyViewController.swift
//  TouchEvents
//
//  Created by Nguyen Duong on 7/3/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class MonkeyViewController: UIViewController, UIGestureRecognizerDelegate {

    var width:CGFloat = 0
    var height:CGFloat = 0
    @IBOutlet weak var monkeyView: UIImageView!
    @IBOutlet weak var commentView: UIImageView!
    @IBOutlet weak var commentLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        commentView.isHidden = true
        commentLabel.isHidden = true
        width = monkeyView.frame.width
        height = monkeyView.frame.height
        pinchGestureRecognizer()
        rotationGestureRecognizer()
        longPressGestureRecognizer()
        doubleTapGestureRecognizer()
        tapGestureRecognizer()
    }
    
    func pinchGestureRecognizer() {
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchAction(_:)))
        pinchGesture.delegate = self
        monkeyView.addGestureRecognizer(pinchGesture)
        monkeyView.isUserInteractionEnabled = true
    }

    @objc func pinchAction(_ gestureRecognizer : UIPinchGestureRecognizer) {
        guard gestureRecognizer.view != nil else {
            return
        }
        
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            if let view = gestureRecognizer.view {
                view.transform = view.transform.scaledBy(x: gestureRecognizer.scale, y: gestureRecognizer.scale)
                gestureRecognizer.scale = 1
            }
            if monkeyView.frame.width >= (width * 2) {
                monkeyView.frame.size.width = width * 2
                monkeyView.frame.size.height = height * 2
            } else if monkeyView.frame.width <= (width * 0.5) {
                monkeyView.frame.size.width = width * 0.5
                monkeyView.frame.size.height = height * 0.5
            }
            monkeyView.center = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2)
        }
    }
    
    func rotationGestureRecognizer() {
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotationAction(_:)))
        rotationGesture.delegate = self
        monkeyView.addGestureRecognizer(rotationGesture)
        monkeyView.isUserInteractionEnabled = true
    }
    
    @objc func rotationAction(_ gestureRecognizer : UIRotationGestureRecognizer) {
        guard gestureRecognizer.view != nil else {
            return
        }
        
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            if let view = gestureRecognizer.view {
                view.transform = view.transform.rotated(by: gestureRecognizer.rotation)
                gestureRecognizer.rotation = 0
            }
        }
    }
    
    func longPressGestureRecognizer() {
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressAction(_:)))
        longPressGesture.delegate = self
        monkeyView.addGestureRecognizer(longPressGesture)
        monkeyView.isUserInteractionEnabled = true
    }
    
    @objc func longPressAction(_ gestureRecognizer : UILongPressGestureRecognizer) {
        guard gestureRecognizer.view != nil else {
            return
        }
        
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            if let view = gestureRecognizer.view {
                view.transform = .identity
            }
        }
        monkeyView.frame.size.width = width
        monkeyView.frame.size.height = height
        monkeyView.center = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2)
    }
    
    func tapGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.delegate = self
        monkeyView.addGestureRecognizer(tapGesture)
        monkeyView.isUserInteractionEnabled = true
    }
    
    @objc func tapAction(_ gestureRecognizer : UITapGestureRecognizer) {
        guard gestureRecognizer.view != nil else {
            return
        }
        if gestureRecognizer.state == .ended {
            commentView.isHidden = false
            commentLabel.isHidden = false
            commentLabel.text = "Tôi là khỉ."
            commentView.alpha = 0
            commentLabel.alpha = 0
            UIView.animate(withDuration: 2.0, delay: 0, options: [.curveEaseOut], animations: {
                self.commentView.alpha = 1
                self.commentLabel.alpha = 1
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                UIView.animate(withDuration: 2.0, delay: 0, options: [.curveEaseOut], animations: {
                    self.commentView.alpha = 0
                    self.commentLabel.alpha = 0
                })
            }
        }
    }
    
    func doubleTapGestureRecognizer() {
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(doubletapAction(_:)))
        doubleTapGesture.numberOfTapsRequired = 2
        doubleTapGesture.delegate = self
        monkeyView.addGestureRecognizer(doubleTapGesture)
        monkeyView.isUserInteractionEnabled = true
    }
    
    @objc func doubletapAction(_ gestureRecognizer : UITapGestureRecognizer) {
        guard gestureRecognizer.view != nil else {
            return
        }
        if gestureRecognizer.state == .ended {
            commentView.isHidden = false
            commentLabel.isHidden = false
            commentLabel.text = "Khỉ là tôi."
            commentView.alpha = 0
            commentLabel.alpha = 0
            UIView.animate(withDuration: 2.0, delay: 0, options: [.curveEaseOut], animations: {
                self.commentView.alpha = 1
                self.commentLabel.alpha = 1
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                UIView.animate(withDuration: 2.0, delay: 0, options: [.curveEaseOut], animations: {
                    self.commentView.alpha = 0
                    self.commentLabel.alpha = 0
                })
            }
        }
    }
}
