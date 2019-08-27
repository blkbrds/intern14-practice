//
//  Ex10ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex10ViewController: BaseViewController {
    //MARK: Outlet
    @IBOutlet private weak var tableView: UITableView!
    var movies = [Movie]()
    
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
        tableView.register(UINib(nibName: "BookCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    override func setupData() {
        movies.removeAll()
        APIManager.Movie.getTop { (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let movies):
                for movie in movies {
                    self.movies.append(movie)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }                
            }
        }
    }
}

extension Ex10ViewController: UITableViewDelegate, UITableViewDataSource {
    //MARK: TableView DataSource
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? BookCell else { return UITableViewCell() }
        
        let movie = movies[indexPath.row]
        self.title = movie.title
        cell.imageString.text = movie.imageStr
        cell.movieName.text = movie.movieName
        
        if let thumbnail = movie.thumbnail {
            cell.imageVieww.image = thumbnail
        } else {
            cell.imageVieww.image = nil
            APIManager.Downloader.downloadImage(imageURL: movie.imageStr, index: indexPath.row) { (image, index) in
                var movie = self.movies[index]
                movie.thumbnail = image
                
                let cell = tableView.cellForRow(at: indexPath) as? BookCell
                cell?.imageVieww.image = image
            }
        }
        
        return cell
    }
    
    //MARK: TableView Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(movies[indexPath.row].movieName)")
    }
}
