//
//  HomeViewModel.swift
//  ExTabbar
//
//  Created by PCI0010 on 9/16/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

protocol HomeViewModelDelegate: class {
    func viewmodel(_ viewModel: HomeViewModel, needperformAction: HomeViewModel.Action )
}

final class HomeViewModel {
    
    var myData: [MyMusic] = []
    var notificationToken: NotificationToken?
    weak var delegate: HomeViewModelDelegate?
    
    // Mark : - Load Data From API
    func loadData(completion: @escaping (Bool) -> ()) {
        ApiManager.Music.getNewMusic(limit: 10) { (result) in
            switch result {
            case .success(let musicResult):
                self.myData.append(contentsOf: musicResult.myMusic)
                self.deleteAllObject()
                self.saveRealm(myMusic: self.myData)
                completion(true)
            case .failure(let error):
                print(error.localizedDescription)
                completion(false)
            }
        }
    }
    
    // Mark: - Realm
    func saveRealm(myMusic: [MyMusic]) {
        RealmManager.shared.add(objects: myMusic)
    }
    
    func fetchData() {
        guard let datas = RealmManager.shared.fetchObjects(MyMusic.self) else { return }
        self.myData = [MyMusic](datas)
        delegate?.viewmodel(self, needperformAction: .reloadData)
    }
    
    func deleteAllObject() {
        guard let datas = RealmManager.shared.fetchObjects(MyMusic.self) else { return }
        RealmManager.shared.deleteAll(objects: [MyMusic](datas))
    }
    
    func observe() {
        notificationToken = RealmManager.shared.observe(type: MyMusic.self, completion: { [ weak self ] _ in
            guard let this = self else { return }
            this.fetchData()
        })
    }
    
    func downloadCellImage(indexPath: IndexPath, completion: @escaping (UIImage?, IndexPath) -> ()) {
        let item = myData[indexPath.row]
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
        return myData.count
    }
    
    func getMusic(with indexPath: IndexPath) -> MyMusic? {
        return myData[indexPath.row]
    }
}

// Mark: - Define
extension HomeViewModel {
    
    enum Action {
        case reloadData
    }
}
