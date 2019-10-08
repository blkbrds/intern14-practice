//
//  Ex3ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex3ViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = "Ex3"
    }
    
    override func setupData() {
    }
    
    
    @IBAction func buttonTouchUpInside(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            let vc = Ex03ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = Ex032ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = Ex033ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
}
