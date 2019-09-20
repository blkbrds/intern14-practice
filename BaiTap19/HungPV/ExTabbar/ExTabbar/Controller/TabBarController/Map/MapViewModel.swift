//
//  MapViewModel.swift
//  ExTabbar
//
//  Created by PCI0010 on 9/19/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

final class MapViewModel {
    
    var myMusic: [MyMusic] = []
    
    func loadData(completion: @escaping (Bool) -> ()) {
        ApiManager.Music.getNewMusic(limit: 10) { (result) in
            switch result {
            case .success(let musicResult):
                self.myMusic.append(contentsOf: musicResult.myMusic)
                self.writeRealm(objects: self.myMusic)
                completion(true)
            case .failure(let error):
                print(error.localizedDescription)
                completion(false)
            }
        }
    }
    
    func writeRealm(objects: [Object]) {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
            objects.forEach({ (object) in
                realm.add(object)
            })
        }
    }
    
    func fetchData(completion: @escaping (Bool) -> ()) {
        do {
            let realm = try! Realm()
            let musics = realm.objects(MyMusic.self)
            print("REALM: Musics total = \(musics.count)")
            self.myMusic.append(contentsOf: musics)
            
            completion(true)
        }
    }
    
    func downloadCellImage(indexPath: IndexPath, completion: @escaping (UIImage?, IndexPath) -> ()) {
        let item = myMusic[indexPath.row]
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

extension MapViewModel {
    func numberOfItems(in section: Int) -> Int {
        return myMusic.count
    }
    
    func getMusic(with indexPath: IndexPath) -> MyMusic? {
        return myMusic[indexPath.row]
    }
}
