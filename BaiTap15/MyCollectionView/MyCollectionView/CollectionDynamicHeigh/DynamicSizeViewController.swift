//
//  DynamicSizeViewController.swift
//  MyCollectionView
//
//  Created by MBA0051 on 10/18/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class DynamicSizeViewController: UIViewController {

    @IBOutlet weak var dynamicSizeCollectionView: UICollectionView!
    let myIdentity = "MyIdentity"

    var numbers: [Int] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for index in 0..<50 {
            numbers.append(index)
        }

//        let layout = dynamicSizeCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.itemSize = CGSize(width: view.frame.width / 4, height: view.frame.width / 4)

        // Regist view collection.
        dynamicSizeCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: myIdentity)
        dynamicSizeCollectionView.dataSource = self
    }
}

extension DynamicSizeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: myIdentity, for: indexPath)
        cell.backgroundColor = .cyan
        return cell
    }
}

extension DynamicSizeViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let randomInt = Int.random(in: 1...4)

        let widthPerItem = view.frame.width / 4
        let height = widthPerItem * CGFloat(randomInt) / 2
        return CGSize(width: widthPerItem, height: height)
    }
}
