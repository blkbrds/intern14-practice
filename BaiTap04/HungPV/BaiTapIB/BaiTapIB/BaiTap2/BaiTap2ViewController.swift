//
//  BaiTap2ViewController.swift
//  BaiTapIB
//
//  Created by PCI0010 on 7/29/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class BaiTap2ViewController: UIViewController {
    //MARK : - Outlet
    @IBOutlet private weak var plusAll: UILabel!
    @IBOutlet private weak var chuoiLabel: UILabel!
    @IBOutlet private weak var nhoLabel: UILabel!
    @IBOutlet private weak var taoLabel: UILabel!
    @IBOutlet private weak var chuoiNum: UILabel!
    @IBOutlet private weak var nhoNum: UILabel!
    @IBOutlet private weak var taoNum: UILabel!
    
    var chuoi = 0
    var nho = 0
    var tao = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        chuoiNum.text = "\(chuoi)"
        taoNum.text = "\(tao)"
        nhoNum.text = "\(nho)"
    }
    //MARK: - Action
    @IBAction func plus(_ sender: Any) {
        let button = sender as! UIButton
        switch button.tag {
        case 0:
            chuoi += 1
            tao += 1
            nho += 1
        case 1:
            chuoi += 1
        case 2:
            nho += 1
        case 3:
            tao += 1
        default:
            print("1")
        }
        
        updateUI()
        
    }
    
    
}

