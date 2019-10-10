//
//  Ex2ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex2ViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = "Ex2"
    }
    
    override func setupData() {
    }
    
    
    @IBAction func buttonTouchUpInside(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            let vc = Ex02ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = Ex022ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
        
    }
}
