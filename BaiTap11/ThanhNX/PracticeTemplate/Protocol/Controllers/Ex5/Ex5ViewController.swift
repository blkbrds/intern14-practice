//
//  Ex5ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

enum Caculate: Int {
    case cong
    case tru
    case nhan
    case chia
    case phanTram
    case luyThua
}

final class Ex5ViewController: BaseViewController {
    //MARK: Outlet
    @IBOutlet private weak var xTextField: UITextField!
    @IBOutlet private weak var yTextField: UITextField!
    @IBOutlet private weak var caculatorButton: UIButton!
    @IBOutlet private weak var resultLabel: UILabel!
    
    var myCaculatorView: MyCaculatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = "Ex5"
        
        caculatorButton.layer.cornerRadius = 10
        guard let myCaculatorView = Bundle.main.loadNibNamed("MyCaculatorView", owner: self, options: nil)?.first as? MyCaculatorView else { return }
        self.myCaculatorView = myCaculatorView
        myCaculatorView.frame = CGRect(x: 0, y: 300, width: view.bounds.width, height: view.bounds.height)
        myCaculatorView.delegate = self
        myCaculatorView.dataSource = self
        view.addSubview(myCaculatorView)
        myCaculatorView.hide(animation: true)
    }
    
    @IBAction func caculatorButtonTouchUpInside() {
        self.myCaculatorView?.show(animation: true)
    }
}

//MARK: Delegate
extension Ex5ViewController: MyCaculatorViewDelegate {
    func view(_ view: MyCaculatorView, needPerforAction action: MyCaculatorView.Action, updateResult: Int?) {
        switch action {
        case .show:
            break
        case .hide:
            break
        case .showResult:
            guard let result = updateResult else { return }
            resultLabel.text = "\(result)"
        case .clearValue:
            caculatorButton.setTitle("?", for: .normal)
            xTextField.text?.removeAll()
            yTextField.text?.removeAll()
        case .caculator:
            guard let result = updateResult else { return }
            guard let changeButtonCaculator: Caculate = Caculate(rawValue: result) else { return }
            switch changeButtonCaculator {
            case .cong:
                caculatorButton.setTitle("+", for: .normal)
            case .tru:
                caculatorButton.setTitle("-", for: .normal)
            case .nhan:
                caculatorButton.setTitle("x", for: .normal)
            case .chia:
                caculatorButton.setTitle("/", for: .normal)
            case .phanTram:
                caculatorButton.setTitle("%", for: .normal)
            case .luyThua:
                caculatorButton.setTitle("x^y", for: .normal)
            }
        }
    }
}

//MARK: DataSource
extension Ex5ViewController: MyCaculatorViewDataSource {
    func getValueX(_ view: MyCaculatorView) -> Int {
        guard let text = xTextField.text, let number = Int(text) else { return 0 }
        return number
    }
    
    func getValueY(_ view: MyCaculatorView) -> Int {
        guard let text = yTextField.text, let number = Int(text) else { return 0 }
        return number
    }
}
