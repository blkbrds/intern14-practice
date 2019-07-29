//
//  Bar1ViewController.swift
//  DemoNavi
//
//  Created by PCI0007 on 7/19/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

class Bar1ViewController: UIViewController {

    @IBOutlet var settingButton: [UIButton]!
    let image = UIImage(named: "i2")
    var image2 = UIImage(named: "i3")

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        adjustButtonApperance()
    }
    
    func adjustButtonApperance() {
        for button in settingButton {
            button.layer.cornerRadius = 20
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.blue.cgColor
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]

        }
    }
    
    func resetNaviBar() {
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.rightBarButtonItem = nil
        navigationController?.navigationBar.backgroundColor = nil
        navigationController?.navigationBar.tintColor = .clear
        navigationItem.rightBarButtonItems = nil
        title = nil
    }

    @IBAction func adjustNaviBarButtonTouchUpInside(_ sender: UIButton) {
        if sender.tag == 0 {
            resetNaviBar()
            title = "Gradient NavigationBar"
            self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        } else if sender.tag == 1 {
            resetNaviBar()
            self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
            let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: view.bounds.width - 20, height: 20))
            searchBar.placeholder = "Search"
            let leftBar = UIBarButtonItem(customView: searchBar)
            self.navigationItem.leftBarButtonItem = leftBar
        } else if sender.tag == 2 {
            resetNaviBar()
            self.navigationController?.navigationBar.barTintColor = .blue
        } else if sender.tag == 3 {
            resetNaviBar()
            self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
            image2 = image2?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
            let button1 = UIBarButtonItem(image: image2, style: .plain, target: self, action: #selector(button1Action))
            let button2 = UIBarButtonItem(image: image2, style: .plain, target: self, action: #selector(button2Action))
            let button3 = UIBarButtonItem(image: image2, style: .plain, target: self, action: #selector(button3Action))
            navigationItem.rightBarButtonItems = [button1, button2, button3]
        }
    }
    
    @objc func button1Action() {
        let image3 = UIImage(named: "i5")
        self.navigationController?.navigationBar.setBackgroundImage(image3, for: .default)
    }
    
    @objc func button2Action() {
        let image3 = UIImage(named: "i6")
        self.navigationController?.navigationBar.setBackgroundImage(image3, for: .default)
    }
    
    @objc func button3Action() {
        let image3 = UIImage(named: "i7")
        self.navigationController?.navigationBar.setBackgroundImage(image3, for: .default)
    }


}
