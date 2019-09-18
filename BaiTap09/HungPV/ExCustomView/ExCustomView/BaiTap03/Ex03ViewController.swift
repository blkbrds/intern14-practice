//
//  Ex03ViewController.swift
//  ExCustomView
//
//  Created by PCI0010 on 8/19/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class Ex03ViewController: UIViewController {
    
    enum ValueTextField : Int {
        case nhietDo
        case doAm
        case sucGio
    }
    
    @IBOutlet weak var nhietDoValue: UITextField!
    @IBOutlet weak var doAmValue: UITextField!
    @IBOutlet weak var sucGioValue: UITextField!
    @IBOutlet weak var nhietDoView: UIView!
    @IBOutlet weak var doAmView: UIView!
    @IBOutlet weak var sucGioView: UIView!
    
    var nhietDoSlider = MySliderView()
    var doAmSlider = MySliderView()
    var sucGioSlider = MySliderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    func configUI() {
        title = " Ex 03 "
        navigationController?.navigationBar.backgroundColor = .cyan
        
        nhietDoSlider = (Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?[0] as? MySliderView)!
        nhietDoSlider.frame = CGRect(x: 82, y: 328, width: 330, height: 90)
        nhietDoSlider.tag = 0
        nhietDoSlider.delegate = self
        nhietDoSlider.dataSource = self
        view.addSubview(nhietDoSlider)
        
        doAmSlider = (Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?[0] as? MySliderView)!
        doAmSlider.frame = CGRect(x: 82, y: 410, width: 330, height: 90)
        doAmSlider.delegate = self
        doAmSlider.tag = 1
        doAmSlider.dataSource = self
        view.addSubview(doAmSlider)
        
        sucGioSlider = (Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?[0] as? MySliderView)!
        sucGioSlider.frame = CGRect(x: 82, y: 505, width: 330, height: 90)
        sucGioSlider.delegate = self
        sucGioSlider.tag = 2
        sucGioSlider.dataSource = self
        view.addSubview(sucGioSlider)
    }
}

extension Ex03ViewController: MySliderViewDelegate {
    func valueChange(_ view: MySliderView, needPerformAction action: MySliderView.Action) {
        switch action {
        case .getPercent(let percent):
            switch ValueTextField(rawValue: view.tag) {
            case .nhietDo?:
                nhietDoValue.text = String(percent)
            case .doAm?:
                doAmValue.text = String(percent)
            case .sucGio?:
                sucGioValue.text = String(percent)
            default:
                print("0")
            }
        }
    }
}

extension Ex03ViewController: MySliderViewDatasource {
    func getValue(_ view: MySliderView) -> Int {
        switch ValueTextField(rawValue: view.tag) {
        case .nhietDo?:
            guard let text = nhietDoValue.text, let number = Int(text) else { return 0 }
            return number
        case .doAm?:
            guard let text = doAmValue.text, let number = Int(text) else { return 0 }
            return number
        case .sucGio?:
            guard let text = sucGioValue.text, let number = Int(text) else { return 0 }
            return number
        default:
            return 0
        }
    }
}

extension Ex03ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nhietDoValue {
            nhietDoSlider.updateView()
        } else if textField == doAmValue {
            doAmSlider.updateView()
        } else if textField == sucGioValue {
            sucGioSlider.updateView()
        }
        return true
    }
}
