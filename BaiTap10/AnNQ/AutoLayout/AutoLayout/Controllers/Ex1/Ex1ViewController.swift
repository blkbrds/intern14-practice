//
//  Ex1ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex1ViewController: BaseViewController {
    
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
    }
    
    override func setupData() {
    }
    
    @IBAction func example1TouchUpInside(_ sender: UIButton) {
        let vc = Ex01ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func example12TouchUpInside(_ sender: UIButton) {
        let vc = Ex012ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
