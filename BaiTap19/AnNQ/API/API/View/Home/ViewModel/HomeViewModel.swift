//
//  HomeViewModel.swift
//  API
//
//  Created by MBA0217 on 10/21/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import Foundation
import UIKit

protocol HomeViewModelDelegate : class {
    func showErrorMessage(_ errorMessage: String)
}

class HomeViewModel {
    
    var places: [Place] = []
    weak var delegate: HomeViewModelDelegate?
    
    //Data
    func loadData(completion: (Bool) -> Void) {
        //goi api
        places = [
            Place(avatar: "coffee", name: "Coffee đèn mờ", address: "01 Bạch Đằng", rating: 8, distance: 3),
            Place(avatar: "coffee", name: "Coffee đèn mờ", address: "01 Bạch Đằng", rating: 8, distance: 3),
            Place(avatar: "coffee", name: "Coffee đèn mờ", address: "01 Bạch Đằng", rating: 8, distance: 3),
            Place(avatar: "coffee", name: "Coffee đèn mờ", address: "01 Bạch Đằng", rating: 8, distance: 3),
            Place(avatar: "coffee", name: "Coffee đèn mờ", address: "01 Bạch Đằng", rating: 8, distance: 3),
            Place(avatar: "coffee", name: "Coffee đèn mờ", address: "01 Bạch Đằng", rating: 8, distance: 3),
            Place(avatar: "coffee", name: "Coffee đèn mờ", address: "01 Bạch Đằng", rating: 8, distance: 3),
        ]
        if places.count > 0 {
            // completion
            completion(true)
        } else {
            completion(false)
            if let delegate = self.delegate {
                delegate.showErrorMessage("Error Message")
            }
        }
    }
    
    
    //TableView
    func getItem(indexPath: IndexPath) -> Place {
        return places[indexPath.row]
    }
    
    func getNumberSection() -> Int {
        return places.count
    }
    
    func getHeightForRow() -> CGFloat {
        return 80
    }
}
