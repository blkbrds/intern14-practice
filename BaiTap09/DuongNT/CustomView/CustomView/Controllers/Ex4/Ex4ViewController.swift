//
//  Ex4ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex4ViewController: BaseViewController {

    // MARK: - outlet

    @IBOutlet weak var emailButtonView: UIView!
    @IBOutlet weak var friendButtonView: UIView!
    @IBOutlet weak var photosButtonView: UIView!

        // MARK: - properties

    var exercise: Exercise?
    let myEmailButton = MyButton()
    let friendButton = MyButton()
    let photosButton = MyButton()

    // MARK: - lifeCycle

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
    }

    // MARK: - customer func

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
