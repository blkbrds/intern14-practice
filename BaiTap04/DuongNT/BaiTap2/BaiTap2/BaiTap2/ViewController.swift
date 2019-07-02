//
//  ViewController.swift
//  BaiTap2
//
//  Created by Nguyen Duong on 6/27/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var chuoiView: UIView!
    @IBOutlet private weak var chuoiLabel: UILabel!
    @IBOutlet private weak var chuoiNumLabel: UILabel!
    @IBOutlet private weak var nhoView: UIView!
    @IBOutlet private weak var nhoNumLabel: UILabel!
    @IBOutlet private weak var nhoLabel: UILabel!
    @IBOutlet private weak var taoView: UIView!
    @IBOutlet private weak var taoLabel: UILabel!
    @IBOutlet private weak var taoNumLabel: UILabel!
    @IBOutlet private weak var addAllButton: UIButton!
    private var chuoiNum = 0
    private var taoNum = 0
    private var nhoNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewUI()
    }
    
    func setViewUI() {
        chuoiView.layer.cornerRadius = 10
        chuoiView.backgroundColor = .blue
        chuoiLabel.text = "Chuoi"
        chuoiNumLabel.text = "0"
        chuoiLabel.textColor = .white
        chuoiNumLabel.textColor = .white
        chuoiLabel.textAlignment = .center
        chuoiNumLabel.textAlignment = .center
        nhoView.layer.cornerRadius = 10
        nhoView.backgroundColor = .blue
        nhoLabel.text = "Nho"
        nhoNumLabel.text = "0"
        nhoLabel.textColor = .white
        nhoNumLabel.textColor = .white
        nhoLabel.textAlignment = .center
        nhoNumLabel.textAlignment = .center
        taoView.layer.cornerRadius = 10
        taoView.backgroundColor = .blue
        taoLabel.text = "Tao"
        taoNumLabel.text = "0"
        taoLabel.textColor = .white
        taoNumLabel.textColor = .white
        taoLabel.textAlignment = .center
        taoNumLabel.textAlignment = .center
        addAllButton.backgroundColor = .orange
        addAllButton.layer.cornerRadius = 10
        addAllButton.frame = CGRect(x: UIScreen.main.bounds.width / 2 - 50, y: UIScreen.main.bounds.height / 2, width: 100, height: 50)
    }
    
    @IBAction private func chuoiButtonTouchUpInside(_ sender: UIView) {
        chuoiNum += 1
        chuoiNumLabel.text = ("\(chuoiNum)")
    }
    
    @IBAction private func nhoButtonTouchUpInside(_ sender: UIView) {
        nhoNum += 1
        nhoNumLabel.text = ("\(nhoNum)")
    }
    
    @IBAction private func taoButtonTouchUpInside(_ sender: UIView) {
        taoNum += 1
        taoNumLabel.text = ("\(taoNum)")
    }
    
    @IBAction private func addAllButtonTouchUpInside(_ sender: UIView) {
        chuoiButtonTouchUpInside(sender)
        nhoButtonTouchUpInside(sender)
        taoButtonTouchUpInside(sender)
    }
}
