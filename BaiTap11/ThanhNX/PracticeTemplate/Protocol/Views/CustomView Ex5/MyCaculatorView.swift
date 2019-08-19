//
//  MyCaculatorView.swift
//  Protocol
//
//  Created by PCI0008 on 8/15/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

protocol MyCaculatorViewDelegate: class {
    func view(_ view: MyCaculatorView, needPerforAction action: MyCaculatorView.Action, updateResult: Int?)
}

protocol MyCaculatorViewDataSource: class {
    func getValueX(_ view: MyCaculatorView) -> Int
    func getValueY(_ view: MyCaculatorView) -> Int
}

final class MyCaculatorView: UIView {    
    enum Caculator: Int {
        case cong
        case tru
        case nhan
        case chia
        case phanTram
        case luyThua
        case clear
    }
    
    enum Action {
        case show
        case hide
        case showResult
        case clearValue
        case caculator
    }
    
    weak var delegate: MyCaculatorViewDelegate?
    weak var dataSource: MyCaculatorViewDataSource?
    private var currentIndex = -1
    
    //MARK: Outlet
    @IBOutlet private weak var markView: UIView!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var xLabel: UILabel!
    @IBOutlet private weak var yLabel: UILabel!
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private var caculatorButtons: [UIButton]!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        for button in caculatorButtons {
            button.layer.borderColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            button.layer.borderWidth = 1
            button.layer.cornerRadius = 20
        }
    }
    
    func show(animation: Bool) {
        guard let xValue = dataSource?.getValueX(self), let yValue = dataSource?.getValueY(self) else { return }
        xLabel.text = String(xValue)
        yLabel.text = String(yValue)
        
        self.isHidden = false
        var frame = containerView.frame
        
        frame.origin.y -= frame.size.height
        
        if animation {
            UIView.animate(withDuration: 0.3, animations: {
                self.containerView.frame = frame
                self.markView.alpha = 0.3
            }) { (done) in
                guard let delegate = self.delegate else { return }
                delegate.view(self, needPerforAction: .show, updateResult: nil)
            }
        } else {
            self.containerView.frame = frame
            self.markView.alpha = 0.3
        }
    }
    
    func hide(animation: Bool) {
        var frame = containerView.frame
        
        frame.origin.y += frame.size.height
        
        if animation {
            UIView.animate(withDuration: 0.3, animations: {
                self.containerView.frame = frame
                self.markView.alpha = 0
            }) { (done) in
                self.isHidden = true
                guard let delegate = self.delegate else { return }
                delegate.view(self, needPerforAction: .hide, updateResult: nil)
            }
        } else {
            self.containerView.frame = frame
            self.markView.alpha = 0
            self.isHidden = true
        }
    }
    
    //MARK: Action
    @IBAction func caculatorButtonTouchUpInside(_ sender: UIButton) {
        guard let xValue = dataSource?.getValueX(self), let yValue = dataSource?.getValueY(self) else { return }
        guard let chooseCaculator: Caculator = Caculator(rawValue: sender.tag) else { return }
        if currentIndex != -1 {
            caculatorButtons[currentIndex].backgroundColor = .white
        }
        switch chooseCaculator {
        case .cong:
            resultLabel.text = String(xValue + yValue)
        case .tru:
            resultLabel.text = String(xValue - yValue)
        case .nhan:
            resultLabel.text = String(xValue * yValue)
        case .chia:
            if yValue == 0 {
                resultLabel.text = "ERROR"
            } else {
                resultLabel.text = String(xValue / yValue)
            }
        case .phanTram:
            resultLabel.text = String(xValue / yValue * 100)
        case .luyThua:
            resultLabel.text = String(pow(Double(xValue), Double(yValue)))
        case .clear:
            for button in 0..<5 {
                caculatorButtons[button].backgroundColor = .white
            }
            hide(animation: true)
            
            guard let delegate = self.delegate else { return }
            delegate.view(self, needPerforAction: .clearValue, updateResult: nil)
        }
        delegate?.view(self, needPerforAction: .caculator, updateResult: sender.tag)
        currentIndex = sender.tag
        caculatorButtons[sender.tag].backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
    }
    
    @IBAction func cancelButtonTouchUpInside() {
        hide(animation: true)
    }
    
    @IBAction func doneButtonTouchUpInside() {
        hide(animation: true)
        guard let delegate = self.delegate else { return }
        delegate.view(self, needPerforAction: .showResult, updateResult: Int(resultLabel.text!))
    }
}
