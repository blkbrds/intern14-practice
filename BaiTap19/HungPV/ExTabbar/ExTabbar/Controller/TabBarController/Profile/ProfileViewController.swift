//
//  ProfileViewController.swift
//  ExTabbar
//
//  Created by PCI0010 on 9/10/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit
import RealmSwift

class ProfileViewController: UIViewController {

    var viewmodel = ProfileViewModel()
        
    @IBOutlet weak var buttonDidClick: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    func configUI() {
        title = "Profile"
        navigationController?.navigationBar.backgroundColor = .cyan
        buttonDidClick.layer.borderWidth = 1
        buttonDidClick.layer.borderColor = UIColor.black.cgColor
        buttonDidClick.layer.cornerRadius = 20
    }
    
    @IBAction func buttonDidClick(_ sender: UIButton) {
        viewmodel.fetchData { (done) in
            if done {
                print("Done!")
            } else {
                print("Can't Fetch Data.")
            }
        }
        navigationController?.pushViewController(HomeViewController(), animated: true)
    }
}
