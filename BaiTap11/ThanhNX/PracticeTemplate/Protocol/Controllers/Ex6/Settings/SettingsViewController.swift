//
//  SettingsViewController.swift
//  Protocol
//
//  Created by PCI0008 on 8/19/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate: class {
    func settingView(_ view: SettingsViewController, needPerformAction action: SettingsViewController.Action, color: UIColor?)
    func settingView(_ view: SettingsViewController, brushSize: CGFloat?)
}

final class SettingsViewController: BaseViewController {
    enum Action {
        case getColor
        case clearImage
    }
    
    //MARK: Outlet
    @IBOutlet private weak var colorLabel: UILabel!
    @IBOutlet private weak var redSlider: UISlider!
    @IBOutlet private weak var greenSlider: UISlider!
    @IBOutlet private weak var blueSlider: UISlider!
    @IBOutlet private weak var brushSizeSlider: UISlider!
    @IBOutlet private weak var colorView: UIView!
    @IBOutlet private weak var resetButton: UIButton!
    @IBOutlet private weak var clearButton: UIButton!
    //MARK: Propeties
    private var customColor: UIColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
    private var customBrush: CGFloat = 5
    
    weak var delegate: SettingsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = "Settings"
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonDidClick))
        navigationItem.rightBarButtonItem = doneButton
        resetButton.layer.cornerRadius = 10
        clearButton.layer.cornerRadius = 10
        colorViewBackground()
    }
    
    //MARK: Custom color
    private func colorViewBackground() {
        colorView.layer.cornerRadius = 15
        colorView.layer.borderWidth = 2
        colorView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        colorView.layer.masksToBounds = true
        guard let red = redSlider, let blue = blueSlider, let green = greenSlider else { return }
        colorLabel.text = "Custom Color (R: \(Int(red.value)), G: \(Int(green.value)), B: \(Int(blue.value)))"
    }
    
    private func colorChangeView(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        customColor = UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: 1)
        colorView.backgroundColor = customColor
        return customColor
    }
    
    @objc func doneButtonDidClick() {
        if let delegate = delegate {
            delegate.settingView(self, needPerformAction: .getColor, color: customColor)
            delegate.settingView(self, brushSize: customBrush)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func sliderValueChange(_ sender: UISlider) {
        guard let red = redSlider, let blue = blueSlider, let green = greenSlider, let brushSize = brushSizeSlider else { return }
        customBrush = CGFloat(brushSize.value)
        colorView.backgroundColor = colorChangeView(red: CGFloat(red.value), green: CGFloat(green.value), blue: CGFloat(blue.value))
        colorLabel.text = "Custom Color (R: \(Int(red.value)), G: \(Int(green.value)), B: \(Int(blue.value)))"
    }
    
    
    @IBAction private func optionsButton(_ sender: UIButton) {
        guard let red = redSlider, let blue = blueSlider, let green = greenSlider, let brushSize = brushSizeSlider else { return }
        if sender.tag == 0 {
            colorView.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
            red.value = 127
            blue.value = 127
            green.value = 127
            brushSize.value = 5
            colorLabel.text = "Custom Color (R: \(Int(red.value)), G: \(Int(green.value)), B: \(Int(blue.value)))"
        } else {
            if let delegate = delegate {
                delegate.settingView(self, needPerformAction: .clearImage, color: nil)
            }
            navigationController?.popViewController(animated: true)
        }
    }
}
