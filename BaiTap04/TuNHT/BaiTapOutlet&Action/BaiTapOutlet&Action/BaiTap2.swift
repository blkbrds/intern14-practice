//
//  BaiTap2.swift
//  BaiTapOutlet&Action
//
//  Created by PCI0001 on 6/26/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class BaiTap2: UIViewController {
    @IBOutlet private weak var chuoiButton: UIButton!
    @IBOutlet private weak var nhoButton: UIButton!
    @IBOutlet private weak var taoButton: UIButton!
    @IBOutlet private weak var allButton: UIButton!
    
    @IBOutlet private weak var chuoiLabel: UILabel!
    @IBOutlet private weak var nhoLabel: UILabel!
    @IBOutlet private weak var taoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chuoiButton.layer.borderColor = UIColor(red: 0, green: 0, blue: 255, alpha: 1).cgColor
        chuoiButton.layer.borderWidth = 1
        chuoiButton.layer.cornerRadius = 10
        
        nhoButton.layer.borderColor = UIColor(red: 0, green: 0, blue: 255, alpha: 1).cgColor
        nhoButton.layer.borderWidth = 1
        nhoButton.layer.cornerRadius = 10
        
        taoButton.layer.borderColor = UIColor(red: 0, green: 0, blue: 255, alpha: 1).cgColor
        taoButton.layer.borderWidth = 1
        taoButton.layer.cornerRadius = 10
        
        allButton.layer.borderColor = UIColor(red: 60, green: 30, blue: 90, alpha: 1).cgColor
        allButton.layer.borderWidth = 1
        allButton.layer.cornerRadius = 10
    }
    
    @IBAction private func chuoiButtonTouchUpInside(_ sender: UIButton) {
        if let text = chuoiLabel.text, let chuoi = Int(text) {
            chuoiLabel.text = "\(chuoi + 1)"
        }
    }
    
    @IBAction private func nhoButtonTouchUpInside(_ sender: UIButton) {
        if let text = nhoLabel.text, let nho = Int(text) {
            nhoLabel.text = "\(nho + 1)"
        }
    }
    
    @IBAction private func taoButtonTouchUpInside(_ sender: UIButton) {
        if let text = taoLabel.text, let tao = Int(text) {
            taoLabel.text = "\(tao + 1)"
        }
    }
    
    @IBAction private func allButtonTouchUpInside(_ sender: UIButton) {
        chuoiButtonTouchUpInside(chuoiButton)
        nhoButtonTouchUpInside(nhoButton)
        taoButtonTouchUpInside(taoButton)
    }
}
