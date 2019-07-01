//
//  Ex02ViewController.swift
//  Baitap-Outlet-Action
//
//  Created by PCI0013 on 6/26/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

class Ex02ViewController: UIViewController {

    @IBOutlet weak var nhoLabel: UILabel!
    @IBOutlet weak var taoLabel: UILabel!
    @IBOutlet weak var chuoiLabel: UILabel!
    @IBOutlet weak var plusAllButton: UIButton!
    @IBOutlet weak var nhoButton: UIButton!
    @IBOutlet weak var taoButton: UIButton!
    @IBOutlet weak var chuoiButton: UIButton!
    var soChuoi = 0
    var soTao = 0
    var soNho = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print()
        
    }
    func print () {
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
    @IBAction func touchPlusAll(_ sender: Any) {
        plusAllButton.backgroundColor = .yellow
        plusAllButton.setTitle("+ 1 All", for: .normal)
        plusAllButton.setTitleColor(.black, for: .normal)
        touchChuoi((Any).self)
        touchTao((Any).self)
        touchNho((Any).self)
    }
    
    @IBAction func touchChuoi(_ sender: Any) {
        chuoiButton.backgroundColor = .blue
        chuoiButton.setTitle("Chuối", for: .normal)
        chuoiButton.setTitleColor(.white, for: .normal)
        soChuoi += 1
        chuoiLabel.text = "\(soChuoi)"
        chuoiLabel.textAlignment = .center
        chuoiLabel.textColor = .white
    }

    @IBAction func touchTao(_ sender: Any) {
        taoButton.backgroundColor = .blue
        taoButton.setTitle("Táo", for: .normal)
        taoButton.setTitleColor(.white, for: .normal)
        soTao += 1
        taoLabel.text = "\(soTao)"
        taoLabel.textAlignment = .center
        taoLabel.textColor = .white
    }
    
    @IBAction func touchNho(_ sender: Any) {
        nhoButton.backgroundColor = .blue
        nhoButton.setTitle("Nho", for: .normal)
        nhoButton.setTitleColor(.white, for: .normal)
        soNho += 1
        nhoLabel.text = "\(soNho)"
        nhoLabel.textAlignment = .center
        nhoLabel.textColor = .white
    }
}

