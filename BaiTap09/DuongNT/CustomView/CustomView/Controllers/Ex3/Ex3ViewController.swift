//
//  Ex3ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex3ViewController: BaseViewController {
    
    var exercise: Exercise?
    fileprivate let nhieDoSlider = MySliderView()
    fileprivate let doAmSlider = MySliderView()
    fileprivate let sucGioSlider = MySliderView()
    @IBOutlet var sliderTextFields: [UITextField]!
    @IBOutlet weak var nhietDoView: UIView!
    @IBOutlet weak var doAmView: UIView!
    @IBOutlet weak var sucGioView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = exercise?.name
        setUpSlider()
    }
    
    override func setupData() {
    }
    
    private func setUpSlider() {
        let sliderView = UIView(frame: CGRect(x: 0, y: 0, width: 222, height: 90))
        nhieDoSlider.frame = sliderView.bounds
        nhieDoSlider.delegate = self
        nhieDoSlider.rightSliderView.backgroundColor = .red
        nhietDoView.addSubview(nhieDoSlider)
        
        doAmSlider.frame = sliderView.bounds
        doAmSlider.delegate = self
        doAmSlider.rightSliderView.backgroundColor = .blue

        doAmView.addSubview(doAmSlider)
        sucGioSlider.frame = sliderView.bounds
        sucGioSlider.delegate = self
        sucGioSlider.rightSliderView.backgroundColor = .green
        sucGioView.addSubview(sucGioSlider)
            
        sliderTextFields.forEach {
            textField in
            switch textField.tag {
            case 1:
                textField.text = ("\(Int(nhieDoSlider.valueOfThumbnai))")
                break
            case 2:
                textField.text = ("\(Int(doAmSlider.valueOfThumbnai))")
                break
            case 3:
                textField.text = ("\(Int(sucGioSlider.valueOfThumbnai))")
                break
            default:
                textField.text = ""
            }
        }
    }
    
    @IBAction func valueEditChanged(_ sender: Any) {
        sliderTextFields.forEach {
            textField in
            guard let value = textField.text else {
                return
            }
            switch textField.tag {
            case 1:
                nhieDoSlider.valueChanged(value: Float(value) ?? 0.0)
                break
            case 2:
                doAmSlider.valueChanged(value: Float(value) ?? 0.0)
                break
            case 3:
                sucGioSlider.valueChanged(value: Float(value) ?? 0.0)
                break
            default:
                break
            }
        }
    }
}

// MARK: - extension

extension Ex3ViewController: MySliderViewDelegate {
    func mySlider(_ mySlider: MySliderView, percent: Int) {
        sliderTextFields.forEach {
            textField in
            switch textField.tag {
            case 1:
                textField.text = ("\(Int(nhieDoSlider.valueOfThumbnai))")
                break
            case 2:
                textField.text = ("\(Int(doAmSlider.valueOfThumbnai))")
                break
            case 3:
                textField.text = ("\(Int(sucGioSlider.valueOfThumbnai))")
                break
            default:
                textField.text = ""
            }
        }
    }
}
