//
//  Bai2OAViewController.swift
//  IBOutletAndIBAction
//
//  Created by PCI0008 on 6/24/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

class Bai2OAViewController: UIViewController {
    @IBOutlet private weak var chuoiLabel: UILabel!
    @IBOutlet private weak var nhoLabel: UILabel!
    @IBOutlet private weak var taoLabel: UILabel!
    @IBOutlet private weak var chuoiButton: UIButton!
    @IBOutlet private weak var nhoButton: UIButton!
    @IBOutlet private weak var taoButton: UIButton!
    @IBOutlet private weak var allButton: UIButton!
    @IBOutlet private weak var chuoiView: UIView!
    @IBOutlet private weak var nhoView: UIView!
    @IBOutlet private weak var taoView: UIView!
    
    struct Config {
        static let xFrameAll = UIScreen.main.bounds.width / 2 - Config.allWidth / 2
        static let yFrameAll = UIScreen.main.bounds.height / 2 - Config.allHeight / 2
        static let allWidth: CGFloat = 110
        static let allHeight: CGFloat = 40
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let frameButtonAll = CGRect(x: Config.xFrameAll, y: Config.yFrameAll, width: Config.allWidth, height: Config.allHeight)
        buttonAll(frame: frameButtonAll)
    }
    
    func buttonAll(frame: CGRect) {
        chuoiView.layer.cornerRadius = 10
        nhoView.layer.cornerRadius = 10
        taoView.layer.cornerRadius = 10
        
        allButton.backgroundColor = .yellow
        allButton.frame = frame
        allButton.layer.cornerRadius = 10
        allButton.setTitle("+1 All", for: .normal)
        allButton.setTitleColor(.black, for: .normal)
    }
    
    @IBAction private func chuoiButtonTouchUpInside(_ sender: Any) {
        if let str = chuoiLabel.text, let num = Int(str) {
            chuoiLabel.text = "\(num + 1)"
        }
    }
    
    @IBAction private func nhoButtonTouchUpInside(_ sender: Any) {
        if let str = nhoLabel.text, let num = Int(str) {
            nhoLabel.text = "\(num + 1)"
        }
    }
    
    @IBAction private func taoButtonTouchUpInside(_ sender: Any) {
        if let str = taoLabel.text, let num = Int(str) {
            taoLabel.text = "\(num + 1)"
        }
    }
    
    @IBAction private func allButtonTouchUpInside(_ sender: Any) {
        if let str = chuoiLabel.text, let num = Int(str) {
            chuoiLabel.text = "\(num + 1)"
        }
        if let str = nhoLabel.text, let num = Int(str) {
            nhoLabel.text = "\(num + 1)"
        }
        if let str = taoLabel.text, let num = Int(str) {
            taoLabel.text = "\(num + 1)"
        }
    }
}
