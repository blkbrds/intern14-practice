//
//  PopUpView.swift
//  CustomViewTest
//
//  Created by Nguyen Duong on 8/5/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class PopUpView: UIView {

    // MARK: Outlets
    @IBOutlet weak var editImageView: UIImageView!
    @IBOutlet weak var editView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var showNameButtonView: UIButton!
    @IBOutlet weak var doneButtonView: UIButton!
    @IBOutlet weak var mainView: UIView!

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Custom func
    func setUpUI() {
        editView.layer.cornerRadius = 50
        editImageView.layer.cornerRadius = 40
        nameTextField.tintColor = .purple
        editImageView.backgroundColor = .purple
    }

}
