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
    // Keep touch in item.
    fileprivate var longPress: UILongPressGestureRecognizer!

    var numbers: [Int] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for index in 0..<50 {
            numbers.append(index)
        }

        // Initial long press even.
        longPress = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressMoveItem(gesture:)))

        // Regist view collection.
        dynamicSizeCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: myIdentity)
        dynamicSizeCollectionView.dataSource = self
        dynamicSizeCollectionView.delegate = self
    }
    
    /**
     * Execute long press and sort item in collections.
     */
    @objc func longPressMoveItem(gesture: UILongPressGestureRecognizer) {
        switch gesture.state {
        case .began:
            print("begin long press.")
            guard let itemPath = dynamicSizeCollectionView.indexPathForItem(at: gesture.location(in: dynamicSizeCollectionView))
                else { return }
            dynamicSizeCollectionView.beginInteractiveMovementForItem(at: itemPath)
        case .changed:
            print("begin change long press.")
            dynamicSizeCollectionView.updateInteractiveMovementTargetPosition(gesture.location(in: dynamicSizeCollectionView))
        case .ended:
            print("begin end long press.")
            dynamicSizeCollectionView.endInteractiveMovement()
        default:
            print("begin cancel long press.")
            dynamicSizeCollectionView.cancelInteractiveMovement()
        }
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
        
        // Setting for re-use item.
        let subViews = cell.contentView.subviews
        for view in subViews where view is UILabel {
            if let view = view as? UILabel {
                view.text = String(numbers[indexPath.row])
                return cell
            }
        }
        
        // Setting to label.
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: cell.contentView.frame.width, height: cell.contentView.frame.height))
        label.text = String(numbers[indexPath.row])
        label.textAlignment = .center
        cell.contentView.addSubview(label)
        // Constrain label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: cell.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
        
        cell.backgroundColor = .cyan
        return cell
    }
    
    /**
     * Enable moving item.
     */
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    /**
     * Consider start and change position.
     */
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let num = numbers.remove(at: sourceIndexPath.item)
        numbers.insert(num, at: destinationIndexPath.item)
    }
}

extension DynamicSizeViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let randomInt = Int.random(in: 1...4)
        let widthPerItem = view.frame.width / 4
        let height = widthPerItem * CGFloat(randomInt) / 3
        return CGSize(width: widthPerItem, height: height)
    }
}
