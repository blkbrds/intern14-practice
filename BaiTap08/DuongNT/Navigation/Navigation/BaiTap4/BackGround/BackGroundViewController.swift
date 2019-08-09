//
//  BackGroundViewController.swift
//  Navigation
//
//  Created by Nguyen Duong on 7/16/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class BackGroundViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Bai Tap 4"
    }

    @IBAction func changeImageBackGroundButtonTouchUpInside(_ sender: Any) {
        title = "Change BackGround"
        navigationController?.navigationBar.setBackgroundImage(UIImage(imageLiteralResourceName: "avatar"), for: .default)
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .white
    }

    @IBAction func changeColorButtonTouchUpInside(_ sender: Any) {
        title = "Change Color"
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.backgroundColor = .green
        navigationController?.navigationBar.tintColor = .red
        navigationController?.navigationBar.isTranslucent = true
    }

    @IBAction func addSearchButtonTouchUpInside(_ sender: Any) {
        title = nil
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.tintColor = .blue
        let searchBar:UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 300, height: 25))
        searchBar.placeholder = "Your placeholder"
        let leftNavBarButton = UIBarButtonItem(customView:searchBar)
        navigationItem.leftBarButtonItem = leftNavBarButton
        let btnCancel = UIButton()
        btnCancel.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        btnCancel.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        btnCancel.setTitle("Cancel", for: .normal)
        btnCancel.setTitleColor(.blue, for: .normal)
        //Set right Bar Button item
        let rightBarButton = UIBarButtonItem()
        rightBarButton.customView = btnCancel
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @IBAction func addBarButtonTouchUpInside(_ sender: Any) {
        title = "BarButtonItem Img"
        let btnCancel = UIBarButtonItem(image: UIImage(named: "cancel"), style: .plain, target: self, action: #selector(cancel))
        //Set right Bar Button item
        navigationItem.rightBarButtonItem = btnCancel
    }
    
    @IBAction func addMoreBarButtonTouchUpInside(_ sender: Any) {
        title = "Add BarButtonItems"
        let share = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(cancel))
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(cancel))
        navigationItem.rightBarButtonItems = [add, share]
    }

    @objc func cancel() {
        navigationItem.leftBarButtonItems = .none
        navigationItem.rightBarButtonItems = .none
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.tintColor = .blue
        title = "Bai Tap 4"
    }
}
