//
//  Bai2ViewController.swift
//  CustomView
//
//  Created by PCI0008 on 7/18/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

final class Bai2ViewController: UIViewController {
    
    @IBOutlet private weak var valueLabel: UILabel!
    @IBOutlet private weak var percentTextField: UITextField!
    @IBOutlet private weak var percentLabel: UILabel!
    private var sliderView: MySliderView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Slider View"
        sliderView = Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?[0] as? MySliderView
        sliderView?.frame = CGRect(x: 30, y: 400, width: 353, height: 96)
        sliderView?.delegate = self
        sliderView?.dataSource = self
        view.addSubview(sliderView!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        percentTextField.resignFirstResponder()
    }
}

extension Bai2ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        sliderView?.reloadDesign()
        return true
    }
}

extension Bai2ViewController: MySliderViewDelegate {
    func view(_ view: MySliderView, needPerformAction action: MySliderView.Action) {
        switch action {
        case .getPercent(let result):
            percentTextField.text = String(result)
        }
    }
}

extension Bai2ViewController: MySliderViewDataSource {
    func getPercent(_ view: MySliderView) -> Int {
        guard let text = percentTextField.text, let number = Int(text) else { return 0 }
        return number
    }
}
