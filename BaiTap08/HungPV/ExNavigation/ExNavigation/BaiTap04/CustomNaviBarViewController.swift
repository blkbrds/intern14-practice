//
//  CustomNaviBarViewController.swift
//  ExNavigation
//
//  Created by PCI0010 on 8/15/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class CustomNaviBarViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        navigationController?.navigationBar.backgroundColor = .cyan
        
    }
    
    //Mark: - UIButton
    
    @IBAction func oneButton(_ sender: UIButton) {
        let image = UIImage(imageLiteralResourceName: "background.png")
        navigationController?.navigationBar.setBackgroundImage(image, for: .default)
    }
    
    @IBAction func twoButton(_ sender: UIButton) {
        navigationController?.navigationBar.tintColor = UIColor.black
    }
    
    @IBAction func threeButton(_ sender: UIButton) {
        let imageButton = UIBarButtonItem(image: UIImage(named: "icon1.png"), style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = imageButton
    }
   
    
    @IBAction func fourButton(_ sender: UIButton) {
        let imageButton = UIBarButtonItem(image: UIImage(named: "icon.png"), style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = imageButton
    }
    
    @IBAction func FiveButton(_ sender: UIButton) {
        let aButton = UIBarButtonItem(title: "A", style: .done, target: self, action: nil)
        let bButton = UIBarButtonItem(title: "B", style: .done, target: self, action: nil)
        let cButton = UIBarButtonItem(title: "C", style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItems = [aButton, bButton, cButton]
        
    }
    @IBAction func ResetAll(_ sender: Any) {
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.tintColor = UIColor.blue
        self.navigationItem.rightBarButtonItems = nil
    }
    
    
}
