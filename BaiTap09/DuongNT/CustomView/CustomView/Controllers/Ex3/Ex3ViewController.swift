//
//  Ex3ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex3ViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet private var sliderTextFields: [UITextField]!
    @IBOutlet private weak var nhietDoView: UIView!
    @IBOutlet private weak var doAmView: UIView!
    @IBOutlet private weak var sucGioView: UIView!

    // MARK: - Properties
    var exercise: Exercise?
    fileprivate let nhietDoSlider = MySliderView()
    fileprivate let doAmSlider = MySliderView()
    fileprivate let sucGioSlider = MySliderView()

     // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: Config
    override func setupUI() {
        super.setupUI()
        self.title = exercise?.name
        setUpSlider()
    }

    override func setupData() {
        super.setupData()
    }

    // MARK: - Customer func
    private func setUpSlider() {
        let sliderView = UIView(frame: CGRect(x: 0, y: 0, width: 222, height: 90))
        nhietDoSlider.frame = sliderView.bounds
        nhietDoSlider.delegate = self
        nhietDoSlider.rightSliderView.backgroundColor = .red
        nhietDoView.addSubview(nhietDoSlider)
        doAmSlider.frame = sliderView.bounds
        doAmSlider.delegate = self
        doAmSlider.rightSliderView.backgroundColor = .blue
        doAmView.addSubview(doAmSlider)
        sucGioSlider.frame = sliderView.bounds
        sucGioSlider.delegate = self
        sucGioSlider.rightSliderView.backgroundColor = .green
        sucGioView.addSubview(sucGioSlider)
        sliderTextFields.forEach { textField in
            switch textField.tag {
            case 1:
                textField.text = ("\(Int(nhietDoSlider.valueOfThumbnai))")
            case 2:
                textField.text = ("\(Int(doAmSlider.valueOfThumbnai))")
            case 3:
                textField.text = ("\(Int(sucGioSlider.valueOfThumbnai))")
            default:
                textField.text = ""
            }
        }
    }

    // MARK: - IBAction function
    @IBAction func valueEditChanged(_ sender: Any) {
        sliderTextFields.forEach { textField in
            guard let value = textField.text else {
                return
            }
            switch textField.tag {
            case 1:
                nhietDoSlider.valueChanged(value: Float(value) ?? 0.0)
            case 2:
                doAmSlider.valueChanged(value: Float(value) ?? 0.0)
            case 3:
                sucGioSlider.valueChanged(value: Float(value) ?? 0.0)
            default: break
            }
        }
    }
}

// MARK: - Extension
extension Ex3ViewController: MySliderViewDelegate {
    func view(_ view: MySliderView, needPerformAction action: MySliderView.Action) {
        sliderTextFields.forEach { textField in
            switch textField.tag {
            case 1:
                textField.text = ("\(Int(nhietDoSlider.valueOfThumbnai))")
            case 2:
                textField.text = ("\(Int(doAmSlider.valueOfThumbnai))")
            case 3:
                textField.text = ("\(Int(sucGioSlider.valueOfThumbnai))")
            default:
                textField.text = ""
            }
        }
    }
}
