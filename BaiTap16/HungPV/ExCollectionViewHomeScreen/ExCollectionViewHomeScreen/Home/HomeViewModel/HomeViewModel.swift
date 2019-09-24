//
//  HomeViewModel.swift
//  ExCollectionViewHomeScreen
//
//  Created by PCI0010 on 9/12/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import Foundation
import UIKit

protocol HomeViewModelDelegate {
    
}

final class HomeViewModel {
    
    //MARK: - Properties
    var isShowCollection = true
    var places: [Place] = []
    var slides: [UIImage] = []
    
    //MARK: - public functions
    func changeState(completion:(Bool) -> ()) {
        isShowCollection = !isShowCollection
        completion(isShowCollection)
    }
    
    //MARK: Datas
    func loadSlide(completion:(Bool) -> ()) {
        slides = [UIImage(named: "ic-car1"),
                  UIImage(named: "ic-car2"),
                  UIImage(named: "ic-car3"),
                  UIImage(named: "ic-car4"),
                  UIImage(named: "ic-car5"),
                  UIImage(named: "ic-car6"),
                  UIImage(named: "ic-car7")] as! [UIImage]
        
        //call back
        completion(true)
    }
    
    func loadData(completion:(Bool) -> ()) {
        //goi api
        //parse data
        places = Place.dummyData()
        //call back
        completion(true)
    }
}

extension HomeViewModel {
    func numberOfSecsion() -> Int {
        return 2
    }
    
    func numberOfItems(in section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return places.count
        }
    }
    
    func getPlace(with indexPath: IndexPath) -> Place? {
        if indexPath.section == 1 {
            return places[indexPath.row]
        } else {
            return nil
        }
    }
}



