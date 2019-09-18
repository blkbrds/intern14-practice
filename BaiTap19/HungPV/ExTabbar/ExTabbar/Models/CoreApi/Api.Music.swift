//
//  Api.Music.swift
//  ExTabbar
//
//  Created by PCI0010 on 9/16/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import Foundation
import UIKit

extension ApiManager.Music {
    struct QueryString {
        func topMusic(limit: Int) -> String {
            return ApiManager.Path.baseURL +
                ApiManager.Path.apple_music +
                ApiManager.Path.hot_tracks +
                ApiManager.Path.music_all +
            "/\(limit)/explicit.json"
        }
        
        func newMusic() -> String {
            return "https://rss.itunes.apple.com/api/v1/us/itunes-music/new-music/all/100/explicit.json"
        }
    }
    
    // tuong duong voi JSON cua API
    struct MusicResult {
        var music: [Music]
        var token: String
    }
    
    static func getNewMusic(limit: Int = 10, completion: @escaping APICompletion<MusicResult>) {
        let urlString = QueryString().newMusic()
        
        API.shared().request(urlString: urlString) { (result) in
            switch result {
            case .failure(let error):
                completion(.failure(error)) // dung error co san~
            case .success(let data):
                //parse data
                if let data = data {
                    //parse
                    let json = data.convertToJSON()
                    let feed = json["feed"] as! JSON
                    let results = feed["results"] as! [JSON]
                    
                    // array
                    var musics: [Music] = []
                    for dic in results {
                        
                        let music = Music(dic: dic)
                        musics.append(music)
                    }
                    
                    // thong tin phu
                    let token = "adsfdsfadsf"
                    
                    // data tra ve cho ViewModel
                    let musicResult = MusicResult(music: musics, token: token)
                    
                    completion(.success(musicResult))
                    
                } else  {
                    completion(.failure(.error("Cannot format data."))) //tao error moi
                }
            }
            
        }
    }
    
    
}
