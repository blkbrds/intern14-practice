//
//  CollectionAlbumsViewController.swift
//  MyCollectionView
//
//  Created by MBA0051 on 10/18/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class CollectionAlbumsViewController: UIViewController {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var albumCollectionView: UICollectionView!
    var images: [UIImage] = []
    private let myIndentity = "MyIdentity"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        images = CommonLogic.share.getListImage()
        
        // Set item size.
        let layout = albumCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: view.frame.width / 4, height: view.frame.width / 4)

        // Regist collection view.
        albumCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: myIndentity)
        albumCollectionView.dataSource = self
        albumCollectionView.delegate = self
    }
}

extension CollectionAlbumsViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: myIndentity, for: indexPath)
        let imageItem = UIImageView(image: images[indexPath.row])
        cell.contentView.addSubview(imageItem)
        imageItem.translatesAutoresizingMaskIntoConstraints = false
        imageItem.centerXAnchor.constraint(equalTo: cell.centerXAnchor).isActive = true
        imageItem.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
        imageItem.widthAnchor.constraint(equalTo: cell.widthAnchor).isActive = true
        imageItem.heightAnchor.constraint(equalTo: cell.heightAnchor).isActive = true
        return cell
    }
    
    /**
     * Click to collection item.
     */
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        mainImageView.image = images[indexPath.row]
    }
}
