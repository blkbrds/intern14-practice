//
//  Ex4ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex4ViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = "Ex4"
    }
    
    override func setupData() {
    }
    
    @IBAction func buttonTouchUpInside(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            let vc = Ex04ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = Ex042ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = Ex043ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = Ex044ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 4:
            let vc = Ex045ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
    
}
