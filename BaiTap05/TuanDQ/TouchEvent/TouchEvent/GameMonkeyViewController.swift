//
//  GameMonkeyViewController.swift
//  TouchEvent
//
//  Created by MBA0051 on 9/27/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class GameMonkeyViewController: UIViewController {

    @IBOutlet weak var mainItem: UIView!
    @IBOutlet weak var startGame: UIButton!
    @IBOutlet weak var monkeyCatch: UIImageView!
    
    var itemArray: [UIView] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func startGameClick(_ sender: Any) {
        
        startGame.isHidden = true
        monkeyCatch.center.x = UIScreen.main.bounds.width / 2
        monkeyCatch.isHidden = false
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (nil) in
            self.start()
        })
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        guard let touch = touches.first else { return }
        if touch.view == monkeyCatch {
            monkeyCatch.center.x = touch.location(in: self.view).x
        }
        
        checkMonkeyCatch()
    }
    
    /**
     * Catch ball and icrement result.
     */
    private func checkMonkeyCatch() {

        var itemX: Float = 0
        var itemY: Float = 0
        var itemH: Float = 0
        var itemW: Float = 0
        var monkeyX: Float = 0
        var monkeyY: Float = 0
        let monkeyH: Float = Float(monkeyCatch.bounds.height)
        let monkeyW: Float = Float(monkeyCatch.bounds.width)

        let frameH = Float(UIScreen.main.bounds.size.height)
        for item in view.subviews {
            if (checkItemType(item: item)) {
                itemX = Float(item.layer.presentation()?.frame.origin.x ?? 0)
                itemY = Float(item.layer.presentation()?.frame.origin.y ?? 0)
                itemH = Float(item.frame.size.height)
                itemW = Float(item.frame.size.width)
                monkeyX = Float(monkeyCatch.center.x)
                monkeyY = Float(monkeyCatch.center.y)

                if ((itemY + itemH/2) <= (itemH + frameH)) && ((itemY + itemH/2) >= (monkeyY - monkeyH/2)) // Check y
                    && ((itemX + itemW/2) > (monkeyX - monkeyW/2)) && ((itemX + itemW/2) < (monkeyX + monkeyW/2)) // Check x
                {
                    item.removeFromSuperview()
                }
            }
        }
    }

    func checkItemType(item: UIView) -> Bool {
        for checkItem in itemArray {
            if (item == checkItem) {
                return true
            }
        }
        return false
    }
    
    private func start() {
        let totalView = view.subviews.count
        print("Total view: \(totalView)")
        
        let index = Int.random(in: 0..<5)
        let displayIndex = index * Int(UIScreen.main.bounds.size.width) / 5
        let duration = Double.random(in: 3..<7)
        
        let item = GameItemView()
        item.view.frame = CGRect(x: displayIndex, y: 0, width: 100, height: 100)
        itemArray.append(item.view)
        view.addSubview(item.view)
        run(view: item.view, time: duration)
    }
    
    private func run(view moveView: UIView, time duration: TimeInterval) {
        UIView.animate(withDuration: duration) {
            moveView.center.y += UIScreen.main.bounds.size.height
        }
    }
}
