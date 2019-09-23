//
//  ProfileViewModel.swift
//  ExTabbar
//
//  Created by PCI0010 on 9/20/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import Foundation
import RealmSwift

final class ProfileViewModel {
    
    var myMusic: [MyMusic] = []
    
    func fetchData(completion: @escaping (Bool) -> ()) {
        ApiManager.Music.getNewMusic(limit: 10) { (result) in
            switch result {
            case .success(let musicResult):
                self.myMusic.append(contentsOf: musicResult.myMusic)
                self.writeRealm()
                completion(true)
            case .failure(_):
                print("Can't Load.")
                completion(false)
            }
        }
    }
    
    func writeRealm() {
        DispatchQueue.global().async {
            
            print("Save \(self.myMusic.count) items")
            do {
                let realm = try Realm()
                try realm.write {
                    for item in self.myMusic {
                        realm.add(item)
                    }
                    
                    DispatchQueue.main.async {
                        print("OK Done")
                    }
                }
                
            } catch let error {
                DispatchQueue.main.async {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
