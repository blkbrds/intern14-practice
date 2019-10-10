//
//  Ex5ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex5ViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = "Ex5"
    }
    
    override func setupData() {
    }
    
    @IBAction func buttonTouchUpInside(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            let vc = Ex05ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = Ex052ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = Ex053ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = Ex054ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 4:
            let vc = Ex055ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
}
