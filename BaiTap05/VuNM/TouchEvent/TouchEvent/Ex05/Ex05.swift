//
//  Ex05.swift
//  TouchEvent
//
//  Created by PCI0007 on 7/3/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

class Ex05: UIViewController, UIGestureRecognizerDelegate{

    @IBOutlet weak var messegeLabel: UILabel!
    @IBOutlet weak var sampleImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        adjustLabel()
    }
    
    func config() {
        sampleImageView.isUserInteractionEnabled = true
        let oneTap = UITapGestureRecognizer(target: self, action: #selector(singleTap(_:)))
        sampleImageView.addGestureRecognizer(oneTap)
        oneTap.numberOfTapsRequired = 1
        oneTap.delegate = self
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTap(_:)))
        doubleTap.delegate = self
        sampleImageView.addGestureRecognizer(doubleTap)
        doubleTap.numberOfTapsRequired = 2
        oneTap.require(toFail: doubleTap)
    }
    
    @objc func singleTap(_ tap: UITapGestureRecognizer) {
        guard tap.view != nil else { return }
        if tap.state == .ended {
            messegeLabel.text = "Tôi là khỉ"
            self.messegeLabel.isHidden = false
            self.messegeLabel.alpha = 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                UILabel.animate(withDuration: 3, animations: { () -> Void in
                    self.messegeLabel.alpha = 0
                })
            }
        }
    }
    
    @objc func doubleTap(_ tap: UITapGestureRecognizer) {
        guard tap.view != nil else { return }
        if tap.state == .ended {
            messegeLabel.text = nil
            messegeLabel.text = "Khỉ là tôi"
            self.messegeLabel.isHidden = false
            self.messegeLabel.alpha = 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                UILabel.animate(withDuration: 3, animations: { () -> Void in
                    self.messegeLabel.alpha = 0
                })
            }
        }
    }
    
    func adjustLabel() {
        messegeLabel.layer.cornerRadius = 50
        messegeLabel.layer.borderWidth = 1
        messegeLabel.layer.borderColor = UIColor.blue.cgColor
        messegeLabel.textColor = .blue
        messegeLabel.clipsToBounds = true
        messegeLabel.backgroundColor = .orange
        messegeLabel.clipsToBounds = true
    }
}
