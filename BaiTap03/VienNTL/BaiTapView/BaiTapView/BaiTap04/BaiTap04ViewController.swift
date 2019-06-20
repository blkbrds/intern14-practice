//
//  BaiTap04ViewController.swift
//  BaiTapView
//
//  Created by Nguyen Truong Lam Vien on 6/20/19.
//  Copyright © 2019 Nguyen Truong Lam Vien. All rights reserved.
//

import UIKit
class Button {
    var button: String = ""
    
    init(_ button: String) {
        self.button = button
    }
}
class BaiTap04ViewController: UIViewController {
    var buttonList: [Button] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func mainView() -> UIView {
        let frameView = CGRect(x: 20, y: 0, width: UIScreen.main.bounds.width - 20, height: 50)
        
    }
}
