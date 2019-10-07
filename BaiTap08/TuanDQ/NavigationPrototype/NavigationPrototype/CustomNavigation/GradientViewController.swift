//
//  GradientViewController.swift
//  NavigationPrototype
//
//  Created by MBA0051 on 10/2/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class GradientViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        changeColorAndBackGround()
        addSearchItem()
//        addBarButton()
        addMultipleBarButton()
    }
    
    func changeColorAndBackGround () {
        //change color and background
        navigationController?.navigationBar.backgroundColor = .blue
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
    }
    
    func changeBackGroundImage () {
        //change bckground image
        let image = UIImage(named: "avatar")
        navigationController?.navigationBar.setBackgroundImage(image, for: .default)
    }
    
    func addSearchItem () {
        //add searchBar to navigation
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(search))
        navigationItem.leftBarButtonItem = searchButton
    }
    
    func addBarButton () {
        let btnCancel = UIBarButtonItem(image: UIImage(named: "cancel"), style: .plain, target: self, action: #selector(cancel))
        //Set right Bar Button item
        navigationItem.rightBarButtonItem = btnCancel
    }
    
    func addMultipleBarButton () {

        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(back))
        navigationItem.leftBarButtonItem = backButton
       
        let addButton = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(back))
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(back))

        navigationItem.rightBarButtonItems = [addButton, editButton]
    }
    
    @objc func search () {
        let view = UITextField(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 150, height: 70))
        let textField = UIBarButtonItem(customView: view)
        navigationItem.leftBarButtonItem = textField
        title = ""
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancel))
        navigationItem.rightBarButtonItem = cancelButton
    }
    
    @objc func cancel () {
        title = "Navigation"
        //add searchBar to navigation
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(search))
        navigationItem.leftBarButtonItem = searchButton
    }
    
    @objc func back() {
        
    }
}
