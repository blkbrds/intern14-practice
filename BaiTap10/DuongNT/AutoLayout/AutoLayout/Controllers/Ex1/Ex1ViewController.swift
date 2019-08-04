//
//  Ex1ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex1ViewController: BaseViewController {
    
    @IBOutlet var buttons: [UIButton]!
    var exercise: Exercise?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = exercise?.name
        buttons.forEach { button in
            button.layer.cornerRadius = 5
        }
    }
    
    override func setupData() {
    }
    
    @IBAction func buttonsActionTouchUpInside(_ button: UIButton) {
        switch button.tag {
        case 1:
            let baiTap1 = BaiTap1ViewController()
            navigationController?.pushViewController(baiTap1, animated: true)
        case 2:
            let baiTap12 = BaiTap12ViewController()
            navigationController?.pushViewController(baiTap12, animated: true)
        default:
            break
        }
    }
    
}
