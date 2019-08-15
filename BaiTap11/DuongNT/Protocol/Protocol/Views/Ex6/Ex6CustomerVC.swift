//
//  Ex6CustomerVC.swift
//  Protocol
//
//  Created by Nguyen Duong on 8/14/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

protocol Ex6CustomerDelegate: class {

    func controller(controller: Ex6CustomerVC, needPerformAction action: Ex6CustomerVC.Action, color: ColorInfor?, brushSize: Float?)
}

class Ex6CustomerVC: BaseViewController {

    // MARK: - Enum
    enum Action {
        case updateSizeItem
        case reset
    }

    // MARK: - Outlets
    @IBOutlet private weak var textInforLabel: UILabel!
    @IBOutlet private weak var colorScreenView: UIView!
    @IBOutlet private weak var redSlider: UISlider!
    @IBOutlet private weak var greenSlider: UISlider!
    @IBOutlet private weak var blueSlider: UISlider!
    @IBOutlet private weak var brushSizeSlider: UISlider!

    // MARK: - Properties
    weak var delegate: Ex6CustomerDelegate?

    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Config
    override func setupUI() {
        super.setupUI()
        self.title = "Settings"

    }

    override func setupData() {
        super.setupData()
        handleColorView()
    }

    // MARK: - Custom func
    private func handleColorView() {
        colorScreenView.layer.cornerRadius = 10
        guard let red = redSlider, let blue = blueSlider, let green = greenSlider else {
            return
        }
        colorChangeView(red: red.value, green: green.value, blue: blue.value)
        textInforLabel.text = "Custom Color (R: \(Int(red.value)), G: \(Int(green.value)), B: \(Int(blue.value)))"
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonClicked))
        navigationItem.rightBarButtonItem = doneButton
    }

    @objc private func doneButtonClicked() {
        guard let red = redSlider, let blue = blueSlider, let green = greenSlider, let brushSize = brushSizeSlider else {
            return
        }
        if let delegate = delegate {
            delegate.controller(controller: self, needPerformAction: .updateSizeItem, color: ColorInfor(red: red.value, green: green.value, blue: blue.value), brushSize: brushSize.value)
        }
        navigationController?.popViewController(animated: true)
    }

    private func colorChangeView(red: Float, green: Float, blue: Float) {
        colorScreenView.backgroundColor = UIColor(red: CGFloat(red / 255), green: CGFloat(green / 255), blue: CGFloat(blue / 255), alpha: 1)
    }

    // MARK: - Actions
    @IBAction private func changeSlider(_ slider: UISlider) {
        guard let red = redSlider, let blue = blueSlider, let green = greenSlider else { return }
        colorChangeView(red: red.value, green: green.value, blue: blue.value)
        textInforLabel.text = "Custom Color (R: \(Int(red.value)), G: \(Int(green.value)), B: \(Int(blue.value)))"
    }

    @IBAction private func resetButtonTouchUpInside(_ button: UIButton) {
        redSlider.value = 100
        blueSlider.value = 100
        greenSlider.value = 100
        brushSizeSlider.value = 10
        handleColorView()
    }

    @IBAction private func clearButtonTouchUpInside(_ button: UIButton) {
        delegate?.controller(controller: self, needPerformAction: .reset, color: nil, brushSize: nil)
        navigationController?.popViewController(animated: true)
    }
}
