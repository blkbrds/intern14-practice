//
//  SlideImagesTableViewCell.swift
//  ExCollectionViewHomeScreen
//
//  Created by PCI0010 on 9/12/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class SlideImagesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageView: UIPageControl!
    
    var timer = Timer()
    var count = 0
    var images = [UIImage(named: "ic-car1"),
                  UIImage(named: "ic-car2"),
                  UIImage(named: "ic-car3"),
                  UIImage(named: "ic-car4"),
                  UIImage(named: "ic-car5"),
                  UIImage(named: "ic-car6"),
                  UIImage(named: "ic-car7"),
    ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(UINib(nibName: "ImageCell", bundle: nil), forCellWithReuseIdentifier: "cell2")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        pageView.numberOfPages = images.count
        pageView.currentPage = 0
        
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
    }
    
    @objc func changeImage() {
        
        if count < images.count {
            let index = IndexPath.init(item: count, section: 0)
            self.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageView.currentPage = count
            count += 1
        } else {
            count = 0
            let index = IndexPath.init(item: count, section: 0)
            self.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            pageView.currentPage = count
            count = 1
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}

extension SlideImagesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as? ImageCell else { return UICollectionViewCell() }
        cell.imageView.image = images[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 200)
    }
}
