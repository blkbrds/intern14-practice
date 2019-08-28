//
//  Ex4ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex4ViewController: BaseViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    
    private var videos = [YouTube]()
    private var token = ""
    
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
        self.title = "Ex4"
        tableView.register(UINib(nibName: "YouTubeCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    override func setupData() {
        APIManager.YouTube.getBot(pageToken: token, maxResults: 10, keyword: "") { (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let dummy):
                self.token = dummy.token
                for video in dummy.video {
                    self.videos.append(video)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension Ex4ViewController: UITableViewDelegate, UITableViewDataSource {
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
    
    //MARK: TableView Delegate
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //Load More Page
        if indexPath.row == videos.count - 3 {
            setupData()
        }
    }
}

extension Ex4ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let trimmedString = String(searchText.filter { !" \n\t\r".contains($0)})
        APIManager.YouTube.getBot(pageToken: "", maxResults: 11, keyword: trimmedString) { (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let dummy):
                self.videos = dummy.video
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
