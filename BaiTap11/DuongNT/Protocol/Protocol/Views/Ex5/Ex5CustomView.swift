//
//  Ex5CustomView.swift
//  Protocol
//
//  Created by Nguyen Duong on 8/13/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

protocol Ex5CustomViewDelegate: class {

    func getX() -> Int?
    func getY() -> Int?
    func popupView(view: Ex5CustomView, needPerform action: Ex5CustomView.Action, result: String?, operation: String?)
}

class Ex5CustomView: UIView {

    enum Action {
        case done
        case cancel
    }

    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var congButton: UIButton!
    @IBOutlet weak var truButton: UIButton!
    @IBOutlet weak var nhanButton: UIButton!
    @IBOutlet weak var chiaNguyenButton: UIButton!
    @IBOutlet weak var chiaDuButton: UIButton!
    @IBOutlet weak var muButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!

    weak var delegate: Ex5CustomViewDelegate? {
        didSet {
            getData()
        }
    }
    var operation: String?

    func getData() {
        if let x = delegate?.getX(), let y = delegate?.getY() {
            xLabel.text = "\(x)"
            yLabel.text = "\(y)"
        }
    }

    @IBAction func cancelButtonTouchUpInside(_ button: UIButton) {
        delegate?.popupView(view: self, needPerform: .cancel, result: resultLabel.text, operation: operation)
    }

    @IBAction func doneButtonTouchUpInside(_ button: UIButton) {
        delegate?.popupView(view: self, needPerform: .done, result: resultLabel.text, operation: operation)
    }

    @IBAction func operatorButtonTouchupInside(_ buttons: UIButton) {
        if let x = delegate?.getX(), let y = delegate?.getY() {
            switch buttons {
            case congButton:
                truButton.backgroundColor = .white
                nhanButton.backgroundColor = .white
                chiaNguyenButton.backgroundColor = .white
                chiaDuButton.backgroundColor = .white
                muButton.backgroundColor = .white
                resultLabel.text = "\(x + y)"
                operation = "+"
            case truButton:
                congButton.backgroundColor = .white
                nhanButton.backgroundColor = .white
                chiaNguyenButton.backgroundColor = .white
                chiaDuButton.backgroundColor = .white
                muButton.backgroundColor = .white
                resultLabel.text = "\(x - y)"
                operation = "-"
            case nhanButton:
                congButton.backgroundColor = .white
                truButton.backgroundColor = .white
                chiaNguyenButton.backgroundColor = .white
                chiaDuButton.backgroundColor = .white
                muButton.backgroundColor = .white
                resultLabel.text = "\(x * y)"
                operation = "X"
            case chiaNguyenButton:
                congButton.backgroundColor = .white
                truButton.backgroundColor = .white
                nhanButton.backgroundColor = .white
                chiaDuButton.backgroundColor = .white
                muButton.backgroundColor = .white
                resultLabel.text = "\(x / y)"
                operation = "/"
            case chiaDuButton:
                congButton.backgroundColor = .white
                truButton.backgroundColor = .white
                nhanButton.backgroundColor = .white
                chiaNguyenButton.backgroundColor = .white
                muButton.backgroundColor = .white
                resultLabel.text = "\(x % y)"
                operation = "%"
            case muButton:
                congButton.backgroundColor = .white
                truButton.backgroundColor = .white
                nhanButton.backgroundColor = .white
                chiaNguyenButton.backgroundColor = .white
                chiaDuButton.backgroundColor = .white
                resultLabel.text = "\(pow(Double(x), Double(y)))"
                operation = "^"
            case clearButton:
                congButton.backgroundColor = .white
                truButton.backgroundColor = .white
                nhanButton.backgroundColor = .white
                chiaNguyenButton.backgroundColor = .white
                chiaDuButton.backgroundColor = .white
                muButton.backgroundColor = .white
                resultLabel.text = nil
                operation = nil
            default:
                break
            }
            buttons.backgroundColor = .green
            clearButton.backgroundColor = .lightGray
        } else {
            resultLabel.text = nil
            operation = nil
        }
    }
}
