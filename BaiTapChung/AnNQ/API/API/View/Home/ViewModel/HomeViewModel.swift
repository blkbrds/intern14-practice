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
    var page: Int = 1
    var limit: Int = 10
    var offset: Int = 0
    
    weak var delegate: HomeViewModelDelegate?
    
    //Data
    func loadData(completion: @escaping (Bool) -> Void) {
        //goi api
       
        ApiManager.Location.getListInLocation(oauth_token: ApiManager.Location.oath_token, v: "20160524", lat: 16.070531, long: 108.224599, limit: limit, offset: offset) { (result) in
            switch result {
            case .failure(let error):
                completion(false)
                if let delegate = self.delegate {
                    delegate.showErrorMessage(error.localizedDescription)
                }
            case .success(let results):
                self.offset += 1
                for place in results.places {
                    self.places.append(place)
                }
                self.page = results.page
                completion(true)
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
