//
//  MessageDetailViewController.swift
//  DatingMessenger
//
//  Created by MBA0051 on 10/19/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class MessageDetailViewController: UIViewController {

    @IBOutlet weak var friendsMessageCollectionView: UICollectionView!
    let myIdentity = "MessageChat"
    var listMessengers: [MessageObject]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Message detail page."
        
        let nib = UINib(nibName: "MessageDetailCollectionViewCell", bundle: nil)
        friendsMessageCollectionView.register(nib, forCellWithReuseIdentifier: myIdentity)
        friendsMessageCollectionView.dataSource = self
        friendsMessageCollectionView.delegate = self
    }
}

extension MessageDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let number = listMessengers?.count {
            return number
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: myIdentity, for: indexPath) as? MessageDetailCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = .brown
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Move to message with user id selected are : \(indexPath.row)")
    }
    
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
}
