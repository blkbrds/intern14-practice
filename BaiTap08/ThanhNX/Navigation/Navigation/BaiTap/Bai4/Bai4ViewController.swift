//
//  Bai4ViewController.swift
//  Navigation
//
//  Created by PCI0008 on 7/17/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

final class Bai4ViewController: UIViewController {

    @IBOutlet private var button: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "CustomNavigation"
        
        for butt in button {
            butt.titleLabel?.textAlignment = .center
            butt.layer.cornerRadius = 10
        }
    }
    
    @IBAction private func customNaviTouchUpInside(_ sender: UIButton) {
        if sender.tag == 0 {
            let navBackgroundImage: UIImage! = UIImage(named: "background")
            self.navigationController?.navigationBar.setBackgroundImage(navBackgroundImage, for: .default)
        } else if sender.tag == 1 {
            navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
            navigationController?.navigationBar.barTintColor = UIColor(red: 53 / 255, green: 97 / 255, blue: 55 / 255, alpha: 1)
            navigationController?.navigationBar.tintColor = .white
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        } else if sender.tag == 2 {
            navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
            title = nil
            navigationController?.navigationBar.backgroundColor = .clear
            let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 314, height: 20))
            searchBar.placeholder = "Search"
            let leftNavBarButton = UIBarButtonItem(customView: searchBar)
            self.navigationItem.leftBarButtonItem = leftNavBarButton
            let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonDidClick))
            navigationItem.rightBarButtonItem = cancelButton
        } else if sender.tag == 3 {
            navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
            let mid1Button = UIBarButtonItem(title: "OPPA", style: .plain, target: self, action: #selector(cancelButtonDidClick))
            let mid2Button = UIBarButtonItem(title: "GANGNAM", style: .plain, target: self, action: #selector(cancelButtonDidClick))
            let mid3Button = UIBarButtonItem(title: "STYLE", style: .plain, target: self, action: #selector(cancelButtonDidClick))
            navigationItem.rightBarButtonItems = [mid3Button, mid2Button, mid1Button]
        } else if sender.tag == 4 {
            navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            button.setImage(#imageLiteral(resourceName: "icons8-super-hero-male-48"), for: .normal)
            button.addTarget(self, action: #selector(cancelButtonDidClick), for: .touchUpInside)
            let rightButton = UIBarButtonItem(customView: button)
            navigationItem.rightBarButtonItem = rightButton
        }
    }
    
    @objc private func cancelButtonDidClick() {
        title = "CustomNavigation"
        navigationItem.leftBarButtonItem = nil
        navigationItem.rightBarButtonItem = nil
        navigationController?.navigationBar.backgroundColor = nil
        self.view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
