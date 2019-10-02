//
//  GameItemView.swift
//  TouchEvent
//
//  Created by MBA0051 on 9/28/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class GameItemView: UIViewController {

    @IBOutlet weak var itemImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func changeImage(name avatarName: String) {
        itemImageView.image = UIImage(named: avatarName)
    }
    
    func changeImage(image img: UIImage) {
        itemImageView.image = img
    }
}
