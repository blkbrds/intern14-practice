//
//  Baitap4ViewController.swift
//  BaiTapNavigation
//
//  Created by PCI0001 on 7/18/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class Baitap4ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Bài tập 4"
    }
    
    @IBAction func changeImageOfBackground(_ sender: UIButton) {
        let image = UIImage(named: "background")
        navigationController?.navigationBar.setBackgroundImage(image, for: .default)
    }
    
    @IBAction func changeTintcolor(_ sender: UIButton) {
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.tintColor = .red
        navigationItem.leftBarButtonItem = .none
    }
    
    @IBAction func addSearchBar(_ sender: UIButton) {
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        searchBar.placeholder = "Search"
        let searchBarButton = UIBarButtonItem(customView: searchBar)
        navigationItem.leftBarButtonItem = searchBarButton
    }
    
    @IBAction func addAndChangeBarButtonItem(_ sender: UIButton) {
        var image = UIImage(named: "reseticon")
        image = image?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        let resetBarButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(reset))
        navigationItem.rightBarButtonItem = resetBarButton
    }
    
    @objc func reset() {
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationItem.leftBarButtonItems = .none
        navigationItem.rightBarButtonItems = .none
        navigationController?.navigationBar.tintColor = .blue
    }
    
    @IBAction func addMoreBarButtonItem(_ sender: UIButton) {
        let left1BarButton = UIBarButtonItem(title: "Left1", style: .plain, target: self, action: #selector(reset))
        let left2BarButton = UIBarButtonItem(title: "Left2", style: .plain, target: self, action: #selector(reset))
        navigationItem.leftBarButtonItems = [left1BarButton, left2BarButton]
        
        let rightBarButton = UIBarButtonItem(title: "Right", style: .plain, target: self, action: #selector(reset))
        navigationItem.rightBarButtonItem = rightBarButton
    }
}
