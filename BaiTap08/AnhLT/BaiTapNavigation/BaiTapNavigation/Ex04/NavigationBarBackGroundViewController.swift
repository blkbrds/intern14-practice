//
//  NavigationBarBackGroundViewController.swift
//  BaiTapNavigation
//
//  Created by PCI0013 on 7/18/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

class NavigationBarBackGroundViewController: UIViewController {

    @IBOutlet var funcButton: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Exercise 4"
        configButton()
    }
    func configButton() {
        for i in funcButton {
            i.layer.borderWidth = 1
        }
    }
    
    @IBAction func changeBackgroundPictureButtonTouchUpInside(_ sender: Any) {
        title = "Change Background Picture"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.setBackgroundImage(UIImage(imageLiteralResourceName: "hinhdepqua"), for: .default)
        self.navigationItem.rightBarButtonItem = nil
        self.navigationItem.leftBarButtonItem = nil
    }
    
    @IBAction func changeColorAndTinColor(_ sender: Any) {
        let searchButton = UIBarButtonItem(image: UIImage(imageLiteralResourceName: "search"), style: .plain
            , target: self, action: nil)
        navigationItem.leftBarButtonItem = searchButton
        let userButton = UIBarButtonItem(image: UIImage(imageLiteralResourceName: "user"), style: .plain
            , target: self, action: nil)
        navigationItem.rightBarButtonItem = userButton
        
        title = "Change Color"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.barTintColor = UIColor(red: 200 / 250, green: 250 / 250, blue: 50 / 250, alpha: 1)
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.isTranslucent = true
    }
    
    @IBAction func addSearchbarButtonTouchUpInside(_ sender: Any) {
        title = nil
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.tintColor = .black
        
        let userButton = UIBarButtonItem(image: UIImage(imageLiteralResourceName: "user"), style: .plain
            , target: self, action: nil)
        navigationItem.rightBarButtonItem = userButton
        
        let searchBar:UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 300, height: 25))
        searchBar.placeholder = "Tap here"
        let leftButton = UIBarButtonItem(customView:searchBar)
        navigationItem.leftBarButtonItem = leftButton
    }
    
    @IBAction func addBarButtonAndChangePictureButtonTouchUpInside(_ sender: Any) {
        title = "Add BarButton Img"
        self.navigationItem.leftBarButtonItem = nil
        let cameraButton = UIBarButtonItem(image: UIImage(imageLiteralResourceName: "camera"), style: .plain
            , target: self, action: nil)
        navigationItem.rightBarButtonItem = cameraButton
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItems = nil

        
    }
    @IBAction func addBarButtonItems(_ sender: Any) {
        title = "Add BarButtonItems"
        let share = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: nil)
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        navigationItem.leftBarButtonItems = [add, share]
        navigationItem.rightBarButtonItem = nil
         navigationController?.navigationBar.tintColor = .black
    }
}
