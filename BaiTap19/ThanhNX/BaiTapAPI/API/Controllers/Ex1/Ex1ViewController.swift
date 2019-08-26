//
//  Ex1ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

final class Ex1ViewController: BaseViewController {
    //MARK: Outlet
    @IBOutlet private weak var tableView: UITableView!
    
    //MARK: Properties
    var images: [Image] = []
    var exercise: Exercise?
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        topAudioBook {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        
        tableView.register(UINib(nibName: "BookCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.rowHeight = UITableView.automaticDimension
        self.title = exercise?.name
    }
}

extension Ex1ViewController: UITableViewDataSource, UITableViewDelegate {
    //MARK: TableView DataSource
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? BookCell else { return UITableViewCell() }
        cell.nameLabel?.text = images[indexPath.row].label
        cell.heigthLabel.text = images[indexPath.row].attributes!["height"] as? String
        downloadImage(completion: { (image) in
            DispatchQueue.main.async {
                cell.bookImageView.image = image
            }
        })
        return cell
    }
    
    //MARK: TableView Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Select book: \(images[indexPath.row])")
    }
}

extension Ex1ViewController {
    struct Image {
        let label: String?
        let attributes: [String: Any]?
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
    
    func topAudioBook(completion: @escaping () -> Void) {
        guard let url = URL(string: Paths.audioBooks) else { return }
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                let json = self.convertToJSON(from: data)
                guard let feed = json["feed"] as? [String: Any], let entry = feed["entry"] as? [[String: Any]], let images = entry[0]["im:image"] as? [[String: Any]] else { return }
                var imgs: [Image] = []
                for index in images {
                    let img = Image(label: index["label"] as? String, attributes: index["attributes"] as? [String: Any])
                    imgs.append(img)
                }
                self.images = imgs
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
    
    func downloadImage(completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: Paths.imageUrl) else { return }
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
