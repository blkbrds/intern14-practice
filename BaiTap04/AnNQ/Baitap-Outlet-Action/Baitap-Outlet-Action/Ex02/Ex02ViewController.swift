//
//  Ex02ViewController.swift
//  Baitap-Outlet-Action
//
//  Created by MBA0217 on 8/16/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

struct Fruit {
    var name: String
    var count: Int
    init(_ name: String,_ count: Int = 0) {
        self.name = name
        self.count = count
    }
}

class Ex02ViewController: UIViewController {

    
    @IBOutlet weak var bananaButton: UIButton!
    @IBOutlet weak var bananaLabel: UILabel!
    
    @IBOutlet weak var grapeButton: UIButton!
    @IBOutlet weak var grapeLabel: UILabel!

    @IBOutlet weak var appleButton: UIButton!
    @IBOutlet weak var appleLabel: UILabel!

    @IBOutlet weak var allButton: UIButton!


    var fruitArray: [Fruit] = [
        Fruit("Chuối", 0),
        Fruit("Nho", 0),
        Fruit("Táo", 0),
        Fruit("+1 all")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateButtonView()
        // Do any additional setup after loading the view.
    }

    func updateButtonView() {
        bananaButton.layer.cornerRadius = 20
        bananaButton.setTitle("\(fruitArray[0].name)", for: .normal)
        bananaLabel.text = "\(fruitArray[0].count)"
        
        grapeButton.layer.cornerRadius = 20
        grapeButton.setTitle("\(fruitArray[1].name)", for: .normal)
        grapeLabel.text = "\(fruitArray[1].count)"
        
        appleButton.layer.cornerRadius = 20
        appleButton.setTitle("\(fruitArray[2].name)", for: .normal)
        appleLabel.text = "\(fruitArray[2].count)"
        
        allButton.layer.cornerRadius = 20
        allButton.setTitle("\(fruitArray[3].name)", for: .normal)
        
    }
    
    @IBAction func bananaButtonTouchUpInside(_ sender: Any) {
        fruitArray[0].count += 1
        bananaLabel.text = "\(fruitArray[0].count)"
    }

    
    @IBAction func grapeButtonTouchUpInside(_ sender: Any) {
        fruitArray[1].count += 1
        grapeLabel.text = "\(fruitArray[1].count)"
    }
    
    @IBAction func appleButtonTouchUpInside(_ sender: Any) {
        fruitArray[2].count += 1
        appleLabel.text = "\(fruitArray[2].count)"
    }
    
    @IBAction func plushAllTouchUpInside(_ sender: Any) {
        bananaButtonTouchUpInside(sender)
        grapeButtonTouchUpInside(sender)
        appleButtonTouchUpInside(sender)

    }
}
