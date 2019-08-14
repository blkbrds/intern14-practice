//
//  Ex5CustomView.swift
//  Protocol
//
//  Created by Nguyen Duong on 8/13/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

protocol Ex5CustomViewDelegate: class {
    func popupView(view: Ex5CustomView, needPerform action: Ex5CustomView.Action, result: String?, operation: String?)
}

protocol Ex5CustomViewDatasource: class {
    func getX() -> Int?
    func getY() -> Int?
}

class Ex5CustomView: UIView {

    enum Action {
        case done
        case cancel
        case show
        case hide
    }

    @IBOutlet weak var markView: UIView!
    @IBOutlet weak var containerView: UIView!
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

    weak var delegate: Ex5CustomViewDelegate?

    weak var dataSource: Ex5CustomViewDatasource?

    var operation: String?

    func config () {
        self.frame = UIScreen.main.bounds
        hide(animation: true)
    }

    func hide(animation: Bool) {
        var frame = containerView.frame
        
        frame.origin.y += frame.size.height
        
        if animation {
            UIView.animate(withDuration: 0.3, animations: {
                self.containerView.frame = frame
                self.markView.alpha = 0
            }) { (done) in
                //delegate
                self.isHidden = true
                if let delegate = self.delegate {
                    delegate.popupView(view: self, needPerform: .hide, result: nil, operation: nil)
                }
            }
        } else {
            self.containerView.frame = frame
            self.markView.alpha = 0
            self.isHidden = true
        }
    }

    func show(animation: Bool) {
        self.isHidden = false
        getData()
        var frame = containerView.frame

        frame.origin.y = self.frame.size.height - frame.size.height
        
        if animation {
            UIView.animate(withDuration: 0.3, animations: {
                self.containerView.frame = frame
                self.markView.alpha = 0.3
            }) { (done) in
                //delegate
                if let delegate = self.delegate {
                    delegate.popupView(view: self, needPerform: .show, result: nil, operation: nil)
                }
            }
        } else {
            self.containerView.frame = frame
            self.markView.alpha = 0.3
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        hide(animation: true)
    }

    func getData() {
        if let x = dataSource?.getX(), let y = dataSource?.getY() {
            xLabel.text = "\(x)"
            yLabel.text = "\(y)"
        }
    }

    @IBAction func cancelButtonTouchUpInside(_ button: UIButton) {
        hide(animation: true)
        delegate?.popupView(view: self, needPerform: .cancel, result: resultLabel.text, operation: operation)
    }

    @IBAction func doneButtonTouchUpInside(_ button: UIButton) {
        hide(animation: true)
        delegate?.popupView(view: self, needPerform: .done, result: resultLabel.text, operation: operation)
    }

    @IBAction func operatorButtonTouchupInside(_ buttons: UIButton) {
        if let x = dataSource?.getX(), let y = dataSource?.getY() {
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
