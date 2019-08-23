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

    var listImage: [Img] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        topAudioBooks {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
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

    private func convertToJSON(from data: Data) -> [String: Any] {
        var json: [String: Any] = [:]
        do {
            if let jsonObj = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                json = jsonObj
            }
        } catch {
            print("JSON casting error")
        }
        return json
    }

    func topAudioBooks(completion: @escaping () -> Void) {
        guard let url = URL(string: Paths.topAudioBooks) else { return }
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                let json = self.convertToJSON(from: data)
                guard let feed = json["feed"] as? [String: Any], let entries = feed["entry"] as? [[String: Any]], let listImg = entries[0]["im:image"] as? [[String: Any]] else {
                    return
                }
                var imgs: [Img] = []
                for index in listImg {
                    let img = Img(label: index["label"] as? String, attribute: index["attributes"] as? [String: Any])
                    imgs.append(img)
                }
                self.listImage = imgs
            }

            if let response = response {
                print(response)
            }

            if let error = error {
                print(error)
            }
            completion()
        }
        task.resume()
    }

    func downloadImage(url: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: url) else { return }
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: url) { (data, response, error) in
            var image: UIImage?
            if let data = data {
                image = UIImage(data: data)
            }
            completion(image)
        }
        task.resume()
    }
}

// MARK: - UITableViewDataSource
extension TopAudioBooksViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listImage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TopAudioBookTableViewCell else {
            return UITableViewCell()
        }
        downloadImage(url: listImage[indexPath.row].label!) { (image) in
            DispatchQueue.main.async {
                cell.imgView.image = image
            }
        }
        cell.urlLabel.text = listImage[indexPath.row].label
        cell.attributeLabel.text = listImage[indexPath.row].attribute!["height"] as? String
        return cell
    }
}

// MARK: - UITableViewDelegate
extension TopAudioBooksViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected: \(listImage[indexPath.row])")
    }
}

