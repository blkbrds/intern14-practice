//
//  DetailViewController.swift
//  ExCollectionViewHomeScreen
//
//  Created by PCI0010 on 9/13/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var viewmodel: DetailViewModel?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        updateUI()
    }
    
    func updateUI() {
        if let viewmodel = viewmodel {
            self.nameLabel.text = viewmodel.name
            self.locationLabel.text = viewmodel.location
            self.ratingLabel.text = "\(viewmodel.rating)/10"
            self.distanceLabel.text = "\(viewmodel.distance)km"
            self.imageView.image = viewmodel.avatarImage
        }
    }
    
    
    func configUI() {
        title = " Detail "
        navigationController?.navigationBar.backgroundColor = .cyan
        
    }
    
}
