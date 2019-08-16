//
//  Ex11ViewController.swift
//  TableView
//
//  Created by Nguyen Duong on 8/16/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

class Ex11ViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties
    var exercise: Exercise?
    private let listConversations: [String] = ["Don't let the expectations and opinions of other people affect your decisions. It's your life, not theirs. Do what matters most to you; do what makes you feel alive and happy. Don't let the expectations and ideas of others limit who you are. If you let others tell you who you are, you are living their reality — not yours. There is more to life than pleasing people. There is much more to life than following others' prescribed path. There is so much more to life than what you experience right now. You need to decide who you are for yourself. Become a whole being. Adventure.Don't let the expectations and opinions of other people affect your decisions. It's your life, not theirs. Do what matters most to you; do what makes you feel alive and happy. Don't let the expectations and ideas of others limit who you are. If you let others tell you who you are, you are living their reality — not yours. There is more to life than pleasing people. There is much more to life than following others' prescribed path. There is so much more to life than what you experience right now. You need to decide who you are for yourself. Become a whole being. Adventure.",
                                               "Don't let the expectations and opinions of other people affect your decisions. It's your life, not theirs.",
                                               "Don't let the expectations and opinions of other people affect your decisions. It's your life, not theirs. Do what matters most to you; do what makes you feel alive and happy. Don't let the expectations and ideas of others limit who you are. If you let others tell you who you are, you are living their reality — not yours.",
                                               "Don't let the expectations and opinions of other people affect your decisions. It's your life, not theirs. Do what matters most to you; do what makes you feel alive and happy. Don't let the expectations and ideas of others limit who you are. If you let others tell you who you are, you are living their reality — not yours. There is more to life than pleasing people. There is much more to life than following others' prescribed path. There is so much more to life than what you experience right now. You need to decide who you are for yourself.",
                                               "Don't let the expectations and opinions of other people affect your decisions. It's your life, not theirs. Do what matters most to you; do what makes you feel alive and happy. Don't let the expectations and ideas of others limit who you are. If you let others tell you who you are, you are living their reality — not yours. There is more to life than pleasing people. There is much more to life than following others' prescribed path. There is so much more to life than what you experience right now. You need to decide who you are for yourself. Become a whole being. Adventure.Don't let the expectations and opinions of other people affect your decisions. It's your life, not theirs. Do what matters most to you; do what makes you feel alive and happy. Don't let the expectations and ideas of others limit who you are. If you let others tell you who you are, you are living their reality — not yours. There is more to life than pleasing people."]

    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Config
    override func setupUI() {
        super.setupUI()
        self.title = exercise?.name
        tableView.register(UINib(nibName: "Ex11Cell", bundle: nil), forCellReuseIdentifier: "Cell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 1
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func setupData() {
        super.setupData()
    }
}
// MARK: - Extensions
extension Ex11ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listConversations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? Ex11Cell
        cell?.conversationLabel?.text = listConversations[indexPath.row]
        return cell!
    }
}
