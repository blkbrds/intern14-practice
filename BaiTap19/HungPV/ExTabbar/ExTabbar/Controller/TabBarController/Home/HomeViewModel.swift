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
    var token: String = "dsafadsfads"
    
    // tu define
    func loadData(completion: @escaping (Bool) -> ()) {
        ApiManager.Music.getNewMusic(limit: 10) { (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
                //call back
                completion(false)
            case  .success(let musicResult):
                //luu data vo ViewModel --> result se bi giai phong
                self.musics.append(contentsOf: musicResult.music)
                self.token = musicResult.token
                
                //call back
                completion(true)
            }
        }
    }
    
    //download image
    func downloadCellImage(indexPath: IndexPath, completion: @escaping (UIImage?, IndexPath) -> ()) {
        let item = musics[indexPath.row]
        ApiManager.Downloader.downloadImage(imageURL: item.artworkUrl100, index: indexPath.row) { (image, index) in
            if let image = image {
                item.artworkImage = image
                completion(image, indexPath)
            } else {
                completion(nil, indexPath)
            }
        }
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
