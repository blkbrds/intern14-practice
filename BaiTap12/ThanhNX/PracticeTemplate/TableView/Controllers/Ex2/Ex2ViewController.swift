//
//  Ex2ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex2ViewController: BaseViewController {
    @IBOutlet private weak var tableView: UITableView!
    var ex2s: [ExName] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = "Ex2"
        
        tableView.register(UINib(nibName: "ExCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    override func setupData() {
        ex2s = DataManagement.share.getName(fileName: "ex2", type: "plist")
    }
}

extension Ex2ViewController: UITableViewDelegate, UITableViewDataSource {
    //MARK: Table View DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ex2s.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ExCell else { return UITableViewCell() }
        let president = ex2s[indexPath.row]
        cell.nameLabel.text = president.name
        
        return cell
    }
}
