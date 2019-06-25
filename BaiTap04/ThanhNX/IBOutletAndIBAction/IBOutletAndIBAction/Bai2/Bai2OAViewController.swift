//
//  Bai2OAViewController.swift
//  IBOutletAndIBAction
//
//  Created by PCI0008 on 6/24/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

class Bai2OAViewController: UIViewController {
    let x = UIScreen.main.bounds.width / 2 - Config.allWidth / 2
    let y = UIScreen.main.bounds.height / 2 - Config.allHeight / 2
    
    @IBOutlet weak var chuoiLabel: UILabel!
    @IBOutlet weak var nhoLabel: UILabel!
    @IBOutlet weak var taoLabel: UILabel!
    @IBOutlet weak var chuoiButton: UIButton!
    @IBOutlet weak var nhoButton: UIButton!
    @IBOutlet weak var taoButton: UIButton!
    @IBOutlet weak var allButton: UIButton!
    @IBOutlet weak var chuoiView: UIView!
    @IBOutlet weak var nhoView: UIView!
    @IBOutlet weak var taoView: UIView!
    
    struct Config {
        static let allWidth: CGFloat = 110
        static let allHeight: CGFloat = 40
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let frameButtonAll = CGRect(x: x, y: y, width: Config.allWidth, height: Config.allHeight)
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
    
    @IBAction func chuoiButtonTouchUpInside(_ sender: Any) {
        if let str = chuoiLabel.text, let num = Int(str) {
            chuoiLabel.text = "\(num + 1)"
        }
        print("Chuoi")
    }
    @IBAction func nhoButtonTouchUpInside(_ sender: Any) {
        if let str = nhoLabel.text, let num = Int(str) {
            nhoLabel.text = "\(num + 1)"
        }
        print("Nho")
    }
    @IBAction func taoButtonTouchUpInside(_ sender: Any) {
        if let str = taoLabel.text, let num = Int(str) {
            taoLabel.text = "\(num + 1)"
        }
        print("Tao")
    }
    @IBAction func allButtonTouchUpInside(_ sender: Any) {
        if let str = chuoiLabel.text, let num = Int(str) {
            chuoiLabel.text = "\(num + 1)"
        }
        if let str = nhoLabel.text, let num = Int(str) {
            nhoLabel.text = "\(num + 1)"
        }
        if let str = taoLabel.text, let num = Int(str) {
            taoLabel.text = "\(num + 1)"
        }
        print("All")
    }
}
