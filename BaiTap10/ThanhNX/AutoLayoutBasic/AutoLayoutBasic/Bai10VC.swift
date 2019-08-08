//
//  Bai10VC.swift
//  AutoLayoutBasic
//
//  Created by PCI0008 on 8/7/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

enum chooseHinhVuong: Int {
    case hinhDo
    case hinhHong
    case hinhTim
    case hinhCam
}

final class Bai10VC: UIViewController {
    //MARK: Layout Width
    @IBOutlet private weak var widthLayoutDoHong: NSLayoutConstraint!
    @IBOutlet private weak var widthLayoutHongTim: NSLayoutConstraint!
    @IBOutlet private weak var widthLayoutTimCam: NSLayoutConstraint!
    @IBOutlet private weak var widthLayoutCamDo: NSLayoutConstraint!
    //MARK: Layout Heigth
    @IBOutlet private weak var heigthLayoutDoHong: NSLayoutConstraint!
    @IBOutlet private weak var heigthLayoutHongTim: NSLayoutConstraint!
    @IBOutlet private weak var heigthLayoutTimCam: NSLayoutConstraint!
    @IBOutlet private weak var heightLayoutCamDo: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: Reset Layout
    private func resetLayout() {
        widthLayoutDoHong.priority = UILayoutPriority(750)
        widthLayoutHongTim.priority = UILayoutPriority(750)
        widthLayoutTimCam.priority = UILayoutPriority(750)
        widthLayoutCamDo.priority = UILayoutPriority(750)
        
        heigthLayoutDoHong.priority = UILayoutPriority(250)
        heigthLayoutHongTim.priority = UILayoutPriority(250)
        heigthLayoutTimCam.priority = UILayoutPriority(250)
        heightLayoutCamDo.priority = UILayoutPriority(250)
    }
    
    @IBAction func buttonsTouchUpInside(_ button: UIButton) {
        guard let chooseHinhVuong = chooseHinhVuong(rawValue: button.tag) else { return }
        switch chooseHinhVuong {
        case .hinhDo:
            resetLayout()
            heigthLayoutDoHong.priority = UILayoutPriority(999)
            widthLayoutHongTim.priority = UILayoutPriority(999)
            widthLayoutTimCam.priority = UILayoutPriority(999)
        case .hinhHong:
            resetLayout()
            heigthLayoutHongTim.priority = UILayoutPriority(999)
            widthLayoutTimCam.priority = UILayoutPriority(999)
            widthLayoutCamDo.priority = UILayoutPriority(999)
        case .hinhTim:
            resetLayout()
            heigthLayoutTimCam.priority = UILayoutPriority(999)
            widthLayoutCamDo.priority = UILayoutPriority(999)
            widthLayoutDoHong.priority = UILayoutPriority(999)
        case .hinhCam:
            resetLayout()
            heightLayoutCamDo.priority = UILayoutPriority(999)
            widthLayoutDoHong.priority = UILayoutPriority(999)
            widthLayoutHongTim.priority = UILayoutPriority(999)
        }
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}
