//
//  Ex2ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex2ViewController: BaseViewController {

    // MARK: - Outlet
    @IBOutlet private weak var valueTextField: UITextField!
    @IBOutlet private weak var sliderView: UIView!

    // MARK: - properties

    var exercise: Exercise?
    private let mySlide = MySliderView()

    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - config
    override func setupUI() {
        super.setupUI()
        self.title = exercise?.name
        mySlide.frame = sliderView.bounds
        mySlide.delegate = self
        valueTextField.text = String(Int(mySlide.valueOfThumbnai))
        sliderView.addSubview(mySlide)
    }

    @IBAction func valueEditChanged(_ sender: Any) {
        guard let value = valueTextField.text else {
            return
        }
        mySlide.valueChanged(value: Float(value) ?? 0.0)
    }

    override func setupData() {
        super.setupData()
    }
}

// MARK: - extension
extension Ex2ViewController: MySliderViewDelegate {
    func view(_ view: MySliderView, needPerformAction action: MySliderView.Action) {
        switch action {
        case .getPercent(let percent):
            valueTextField.text = String(percent)
        }
    }
}
