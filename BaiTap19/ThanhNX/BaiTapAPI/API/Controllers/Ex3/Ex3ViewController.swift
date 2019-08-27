//
//  Ex3ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex3ViewController: BaseViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    
    var videos = [YouTube]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = "Ex3"
        tableView.register(UINib(nibName: "YouTubeCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    override func setupData() {
        videos.removeAll()
        APIManager.YouTube.getTop(keyword: "") { (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let videos):
                for video in videos {
                    self.videos.append(video)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension Ex3ViewController: UITableViewDelegate, UITableViewDataSource {
    //MARK: TableView DataSource
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? YouTubeCell else { return UITableViewCell() }
        
        let video = videos[indexPath.row]
        cell.titleVideo.text = video.titleVideo
        
        cell.publishTitle.text = video.publishedAt
        cell.channelTitle.text = video.channelTitle
        
        if let thumbnail = video.thumbnail {
            cell.videoImage.image = thumbnail
        } else {
            cell.videoImage.image = nil
            APIManager.Downloader.downloadImage(imageURL: video.imageStr, index: indexPath.row) { (image, index) in
                var video = self.videos[index]
                video.thumbnail = image
                
                let cell = tableView.cellForRow(at: indexPath) as? YouTubeCell
                cell?.videoImage.image = image
            }
        }
        return cell
    }
}

//MARK: SearchBar Delegate
extension Ex3ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        var trimmedString = searchText.trimmingCharacters(in: .whitespaces)
        trimmedString = trimmedString.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
        APIManager.YouTube.getTop(keyword: trimmedString) { (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let videos):
                self.videos = videos
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
