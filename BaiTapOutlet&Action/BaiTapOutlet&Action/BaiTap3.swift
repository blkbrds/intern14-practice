//
//  BaiTap3.swift
//  BaiTapOutlet&Action
//
//  Created by PCI0001 on 6/26/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class BaiTap3: UIViewController {
    @IBOutlet private weak var vuLabel: UILabel!
    @IBOutlet private weak var tuLabel: UILabel!
    @IBOutlet private weak var anhLabel: UILabel!
    @IBOutlet private weak var thanhLabel: UILabel!
    @IBOutlet private weak var vienLabel: UILabel!
    @IBOutlet private weak var messiLabel: UILabel!
    @IBOutlet private weak var cr7Label: UILabel!
    @IBOutlet private weak var rooneyLabel: UILabel!
    @IBOutlet private weak var pogbaLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func vuButtonTouchUpInside(_ sender: UIButton) {
        print("Vũ")
    }
    
    @IBAction private func tuButtonTouchUpInside(_ sender: UIButton) {
        print("Tú")
    }
    
    @IBAction private func anhButtonTouchUpInside(_ sender: UIButton) {
        print("T.Anh")
    }
    
    @IBAction private func thanhButtonTouchUpInside(_ sender: UIButton) {
        print("Thành")
    }
    
    @IBAction private func vienButtonTouchUpInside(_ sender: UIButton) {
        print("Viên")
    }
    
    @IBAction private func messiButtonTouchUpInside(_ sender: UIButton) {
        print("Messi")
    }
    
    @IBAction private func cr7ButtonTouchUpInside(_ sender: UIButton) {
        print("Ronaldo")
    }
    
    @IBAction private func rooneyButtonTouchUpInside(_ sender: UIButton) {
        print("Rooney")
    }
    
    @IBAction private func pogbaButtonTouchUpInside(_ sender: UIButton) {
        print("Pogba")
    }
}
