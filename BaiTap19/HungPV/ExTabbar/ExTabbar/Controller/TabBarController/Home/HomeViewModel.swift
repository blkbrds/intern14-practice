//
//  HomeViewModel.swift
//  ExTabbar
//
//  Created by PCI0010 on 9/16/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import Foundation
import UIKit

final class HomeViewModel {
    
    var musics: [Music] = []
    
    func loadData(completion:(Bool) -> ()) {
        //goi api
        //parse data
        musics = Music.dummyData()
        //call back
        completion(true)
    }
}

extension HomeViewModel {
    
    func numberOfItems(in section: Int) -> Int {
        return musics.count
    }
    
    func getMusic(with indexPath: IndexPath) -> Music? {
        return musics[indexPath.row]
        }
    
}
