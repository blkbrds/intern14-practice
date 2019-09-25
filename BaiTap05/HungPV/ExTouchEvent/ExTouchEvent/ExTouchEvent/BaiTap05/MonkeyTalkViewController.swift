//
//  MonkeyTalkViewController.swift
//  ExTouchEvent
//
//  Created by PCI0010 on 8/19/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class MonkeyTalkViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var tap = UITapGestureRecognizer()
    var doubleTap = UITapGestureRecognizer()
    let myMonkey = UIImage(imageLiteralResourceName: "monkey.png")
    
    //Mark: - Outlet
    @IBOutlet weak var TalkLabel: UILabel!
    @IBOutlet weak var MonkeyView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    //Mark: - Function
    func configUI() {
        title = "Monkey Talk"
        navigationController?.navigationBar.backgroundColor = .cyan
        MonkeyView.image = myMonkey
        TalkLabel.layer.borderWidth = 1
        TalkLabel.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        TalkLabel.layer.cornerRadius = 30
        
        tap = UITapGestureRecognizer(target: self, action: #selector(tapped(_:)))
        view.addGestureRecognizer(tap)
        tap.delegate = self
        
        doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped(_:)))
        view.addGestureRecognizer(doubleTap)
        doubleTap.delegate = self
        doubleTap.numberOfTapsRequired = 2
        
    }
    
    @objc func tapped(_ sender: UITapGestureRecognizer){
        guard sender.view != nil else { return }
        if sender.state == .ended {
            TalkLabel.text = "I'm Monkey"
            TalkLabel.isHidden = false
            TalkLabel.alpha = 0
            UIView.animate(withDuration: 2.0, delay: 0, options: [.autoreverse], animations: {
                self.TalkLabel.alpha = 1
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                UIView.animate(withDuration: 2.0, delay: 1, options: [.curveEaseInOut], animations: {
                    self.TalkLabel.alpha = 0
                })
            }
        }
    }
    
    @objc func doubleTapped(_ sender: UITapGestureRecognizer){
        guard sender.view != nil else { return }
        if sender.state == .ended {
            TalkLabel.text = "Monkey is me"
            TalkLabel.isHidden = false
            TalkLabel.alpha = 0
            UIView.animate(withDuration: 2.0, delay: 0, options: [.autoreverse], animations: {
                self.TalkLabel.alpha = 1
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                UIView.animate(withDuration: 2.0, delay: 1, options: [.curveEaseInOut], animations: {
                    self.TalkLabel.alpha = 0
                })
            }
        }
    }
    
    
}
