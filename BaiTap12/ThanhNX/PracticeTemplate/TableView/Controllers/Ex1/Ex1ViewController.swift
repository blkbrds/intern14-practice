//
//  Ex1ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex1ViewController: BaseViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    private var names: [UserName] = []
    
    var exercise: Exercise?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = exercise?.name
        tableView.register(UINib(nibName: "NameUserCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    override func setupData() {
        names = UserName.dummyData()
    }
}

extension Ex1ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? NameUserCell, indexPath.row < names.count else { return UITableViewCell() }
        let item = names[indexPath.row]
        cell.nameLabel.text = item.name
        
        return cell
    }
}
