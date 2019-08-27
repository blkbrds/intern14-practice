//
//  Ex02ViewController.swift
//  ExCustomView
//
//  Created by PCI0010 on 8/19/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class Ex02ViewController: UIViewController {
    
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var mySliderView: UIView!
    
    var sliderView: MySliderView?
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    func configUI() {
        title = " Ex 02 "
        navigationController?.navigationBar.backgroundColor = .cyan
        sliderView = Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?[0] as? MySliderView
        sliderView?.frame = CGRect(x: 42, y: 285, width: 290, height: 124)
        sliderView?.delegate = self
        sliderView?.dataSource = self
        view.addSubview(sliderView!)
    }
}

extension Ex02ViewController: MySliderViewDelegate {
    func valueChange(_ view: MySliderView, needPerformAction action: MySliderView.Action) {
        switch action {
        case .getPercent(let num):
            valueTextField.text = String(num)
        }
    }
}

extension Ex02ViewController: MySliderViewDatasource {
    func getValue(_ view: MySliderView) -> Int {
        guard let text = valueTextField.text, let newNum = Int(text) else { return 0 }
        return newNum
    }
}

extension Ex02ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        sliderView?.updateView()
        return true 
    }
}
