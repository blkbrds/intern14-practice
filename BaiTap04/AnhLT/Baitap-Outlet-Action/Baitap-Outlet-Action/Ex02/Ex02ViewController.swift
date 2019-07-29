//
//  Ex02ViewController.swift
//  Baitap-Outlet-Action
//
//  Created by PCI0013 on 6/26/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

class Ex02ViewController: UIViewController {

    @IBOutlet private weak var nhoLabel: UILabel!
    @IBOutlet private weak var taoLabel: UILabel!
    @IBOutlet private weak var chuoiLabel: UILabel!
    @IBOutlet private weak var plusAllButton: UIButton!
    @IBOutlet private weak var nhoButton: UIButton!
    @IBOutlet private weak var taoButton: UIButton!
    @IBOutlet private weak var chuoiButton: UIButton!
    var soChuoi = 0
    var soTao = 0
    var soNho = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    func configUI() {
        plusAllButton.backgroundColor = .yellow
        plusAllButton.setTitle("+ 1 All", for: .normal)
        plusAllButton.setTitleColor(.black, for: .normal)
        plusAllButton.layer.cornerRadius = 10
        
        chuoiButton.backgroundColor = .blue
        chuoiButton.setTitle("Chuối", for: .normal)
        chuoiButton.setTitleColor(.white, for: .normal)
        chuoiButton.layer.cornerRadius = 10
        
        
        nhoButton.backgroundColor = .blue
        nhoButton.setTitle("Nho", for: .normal)
        nhoButton.setTitleColor(.white, for: .normal)
        nhoButton.layer.cornerRadius = 10
        
        taoButton.backgroundColor = .blue
        taoButton.setTitle("Táo", for: .normal)
        taoButton.setTitleColor(.white, for: .normal)
        taoButton.layer.cornerRadius = 10
        
        chuoiLabel.text = "\(soChuoi)"
        chuoiLabel.textAlignment = .center
        chuoiLabel.textColor = .white
        
        taoLabel.text = "\(soTao)"
        taoLabel.textAlignment = .center
        taoLabel.textColor = .white
        
        nhoLabel.text = "\(soNho)"
        nhoLabel.textAlignment = .center
        nhoLabel.textColor = .white
    }
    
    @IBAction private func plusAllButtonTouchUpInside(_ sender: Any) {
        plusAllButton.backgroundColor = .yellow
        plusAllButton.setTitle("+ 1 All", for: .normal)
        plusAllButton.setTitleColor(.black, for: .normal)
        chuoiButtonTouchUpInside(Any.self)
        taoButtonTouchUpInside(Any.self)
        nhoButtonTouchUpInside(Any.self)
    }
    
    @IBAction private func chuoiButtonTouchUpInside(_ sender: Any) {
        chuoiButton.backgroundColor = .blue
        chuoiButton.setTitle("Chuối", for: .normal)
        chuoiButton.setTitleColor(.white, for: .normal)
        soChuoi += 1
        chuoiLabel.text = "\(soChuoi)"
        chuoiLabel.textAlignment = .center
        chuoiLabel.textColor = .white
    }

    @IBAction private func taoButtonTouchUpInside(_ sender: Any) {
        taoButton.backgroundColor = .blue
        taoButton.setTitle("Táo", for: .normal)
        taoButton.setTitleColor(.white, for: .normal)
        soTao += 1
        taoLabel.text = "\(soTao)"
        taoLabel.textAlignment = .center
        taoLabel.textColor = .white
    }
    
    @IBAction private func nhoButtonTouchUpInside(_ sender: Any) {
        nhoButton.backgroundColor = .blue
        nhoButton.setTitle("Nho", for: .normal)
        nhoButton.setTitleColor(.white, for: .normal)
        soNho += 1
        nhoLabel.text = "\(soNho)"
        nhoLabel.textAlignment = .center
        nhoLabel.textColor = .white
    }
}
