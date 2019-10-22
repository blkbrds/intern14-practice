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
    
    weak var delegate: HomeViewModelDelegate?
    
    //Data
    func loadData(limit: Int = 10, offset:Int = 0, completion: @escaping (Bool) -> Void) {
        //goi api
       
        ApiManager.Location.getListInLocation(oauth_token: "3IHPZFJ0LWOKCHTHQMWAOZMX40VQV0S3PMZKNUMYZGHUP4WJ", v: "20160524", lat: 16.070531, long: 108.224599, limit: limit, offset: offset) { (result) in
            switch result {
            case .failure(let error):
                completion(false)
                if let delegate = self.delegate {
                    delegate.showErrorMessage(error.localizedDescription)
                }
            case .success(let results):
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
