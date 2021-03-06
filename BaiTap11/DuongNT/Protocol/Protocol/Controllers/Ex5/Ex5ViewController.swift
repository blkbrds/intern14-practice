//
//  Ex5ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex5ViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet weak var operationButton: UIButton!
    @IBOutlet weak var xTextField: UITextField!
    @IBOutlet weak var yTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!

    // MARK: - Properties
    var exercise: Exercise?
    var selectView: Ex5CustomView?
    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Config
    override func setupUI() {
        super.setupUI()
        self.title = exercise?.name
        selectView = Bundle.main.loadNibNamed("Ex5CustomView", owner: self, options: nil)?[0] as? Ex5CustomView
        selectView?.config()
        selectView?.delegate = self
        selectView?.dataSource = self
        view.addSubview(selectView!)
    }

    override func setupData() {
        super.setupData()
    }

    // MARK: - Actions
    @IBAction func operationButtonTouchUpInside(_ button: UIButton) {
        resultLabel.text = "??????"
        selectView?.show(animation: true)
    }
}

extension Ex5ViewController: Ex5CustomViewDelegate, Ex5CustomViewDatasource {

    func popupView(view: Ex5CustomView, needPerform action: Ex5CustomView.Action, result: String?, operation: String?) {
        switch action {
        case .done:
            if let result = result, let operation = operation {
                resultLabel.text = result
                operationButton.titleLabel?.text = operation
            } else {
                // create the alert
                let alert = UIAlertController(title: "Warning",
                                              message: "Please, delete value of X & Y.",
                                              preferredStyle: UIAlertController.Style.alert)
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                // show the alert
                self.present(alert, animated: true, completion: nil)
            }
        case .cancel: break
        case .show: break
        case .hide: break
        }
        
    }

    func getX() -> Int? {
        if let value = self.xTextField?.text, let x = Int(value) {
            return x
        } else {
            return nil
        }
    }

    func getY() -> Int? {
        if let value = self.yTextField?.text, let x = Int(value) {
            return x
        } else {
            return nil
        }
    }
}

// MARK: - IBDesignable
@IBDesignable extension UIButton {

    @IBInspectable var cornerRadius: Double {
        get {
            return Double(self.layer.cornerRadius)
        }set {
            self.layer.cornerRadius = CGFloat(newValue)
        }
    }

    @IBInspectable var borderWidth: Double {
        get {
            return Double(self.layer.borderWidth)
        }
        set {
            self.layer.borderWidth = CGFloat(newValue)
        }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
}

// MARK: - IBDesignable
@IBDesignable extension UITextField {

    @IBInspectable var cornerRadius: Double {
        get {
            return Double(self.layer.cornerRadius)
        }set {
            self.layer.cornerRadius = CGFloat(newValue)
        }
    }

    @IBInspectable var borderWidth: Double {
        get {
            return Double(self.layer.borderWidth)
        }
        set {
            self.layer.borderWidth = CGFloat(newValue)
        }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
}
