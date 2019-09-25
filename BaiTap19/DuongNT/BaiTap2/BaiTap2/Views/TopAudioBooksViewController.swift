//
//  TopAudioBooksViewController.swift
//  BaiTap2API
//
//  Created by Nguyen Duong on 8/23/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class TopAudioBooksViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var books = [AudioBook]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }

    // MARK: - Private functions
    private func setupUI() {
        title = "Top Audio Books"
        setupTableView()
    }

    private func setupTableView() {
        tableView.register(UINib(nibName: "TopAudioBookTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func loadData() {
        //api.delegate = self
        
        books.removeAll()
        ApiManager.Audio.getTop { (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let audioBooks):
                for book in audioBooks {
                    self.books.append(book)
                }
                self.tableView.reloadData()
            }
        }
    }
    
}
// MARK: - UITableViewDataSource
extension TopAudioBooksViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TopAudioBookTableViewCell else {
            return UITableViewCell()
        }

        let book = books[indexPath.row]
        cell.urlLabel.text = book.imageStr
        
        if let thumbnail = book.thumbnail {
            cell.imgView.image = thumbnail
        } else {
            cell.imgView.image = nil
            ApiManager.Downloader.downloadImage(imageURL: book.imageStr, index: indexPath.row) { (image, index) in
                var book = self.books[index]
                book.thumbnail = image
                
                let cell = tableView.cellForRow(at: indexPath) as? TopAudioBookTableViewCell
                cell?.imgView.image = image
            }
        }
        
        
       
        return cell
    }
}

// MARK: - UITableViewDelegate
extension TopAudioBooksViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

