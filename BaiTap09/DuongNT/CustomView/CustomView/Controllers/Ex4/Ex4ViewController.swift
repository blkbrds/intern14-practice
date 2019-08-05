//
//  Ex4ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex4ViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet private weak var emailButtonView: UIView!
    @IBOutlet private weak var friendButtonView: UIView!
    @IBOutlet private weak var photosButtonView: UIView!

        // MARK: - Properties
    var exercise: Exercise?
    private let myEmailButton = MyButton()
    private let friendButton = MyButton()
    private let photosButton = MyButton()

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - config
    override func setupUI() {
        super.setupUI()
        self.title = exercise?.name
        setUpButton()
    }

    override func setupData() {
        super.setupData()
    }

    // MARK: - Customer func
    private func setUpButton() {
        myEmailButton.loadNib()
        myEmailButton.setUpUIButton(color: nil, name: "Email", badge: 10, position: .bottomCenter)
        emailButtonView.addSubview(myEmailButton)
        friendButton.loadNib()
        friendButton.setUpUIButton(color: .yellow, name: "Friends", badge: 100, position: .topLeft)
        friendButtonView.addSubview(friendButton)
        photosButton.loadNib()
        photosButton.setUpUIButton(color: .purple, name: "Photos", badge: 8, position: .topCenter)
        photosButtonView.addSubview(photosButton)
    }
}
