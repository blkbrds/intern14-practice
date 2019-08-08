//
//  Ex13ViewController.swift
//  AutoLayout
//
//  Created by Nguyen Duong on 8/8/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

class Ex13ViewController: BaseViewController {

    // MARK: - Properties
    var exercise: Exercise?

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Config
    override func setupUI() {
        super.setupUI()
        navigationItem.title = exercise?.name
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        let menuButtonBar = UIBarButtonItem(image: UIImage(named: "ic-menu"), style: .plain, target: self, action: #selector(menuButtonCliked))
        let addButtonBar = UIBarButtonItem(image: UIImage(named: "ic-bar-add"), style: .plain, target: self, action: #selector(addButtonCliked))
        navigationItem.leftBarButtonItem = menuButtonBar
        navigationItem.rightBarButtonItem = addButtonBar
        navigationController?.navigationBar.tintColor = .yellow
        navigationController?.navigationBar.barTintColor = .red
    }

    override func setupData() {
        super.setupData()
    }

    @objc private func menuButtonCliked() {
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.tintColor = .blue
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.popViewController(animated: true)
    }

    @objc private func addButtonCliked() {
        print("button add clicked!")
    }
}

// MARK: - IBDesignable
@IBDesignable extension UIImageView {
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
}
