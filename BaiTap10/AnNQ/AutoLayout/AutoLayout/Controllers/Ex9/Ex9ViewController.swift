//
//  Ex9ViewController.swift
//  AutoLayout
//
//  Created by MBA0217 on 10/4/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

class Ex9ViewController: BaseViewController {

    @IBOutlet weak var numberImageLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var imageScroll: UIScrollView!
    private var currentOffsetX: CGFloat = 0
    private let contentImage: [String] = [
        "For example, if you wanted to present several (n) pages that could be scrolled through, you could create a UIScrollView with contentSize (n*pageWidth, pageHeight) and with frame size (pageWidth, pageHeight). You could then use contentOffset.x to determine (or set) which page was being (or should be) displayed",
        "It could be considered as the coordinate of the origin of scrollView's frame relative to the origin of its contentView's frame. See the picture below:",
        "For example, if you wanted to present several (n) pages that could be scrolled through, you could create a UIScrollView with contentSize (n*pageWidth, pageHeight) and with frame size (pageWidth, pageHeight). You could then use contentOffset.x to determine (or set) which page was being (or should be) displayed",
        "It could be considered as the coordinate of the origin of scrollView's frame relative to the origin of its contentView's frame. See the picture below:",
        "For example, if you wanted to present several (n) pages that could be scrolled through, you could create a UIScrollView with contentSize (n*pageWidth, pageHeight) and with frame size (pageWidth, pageHeight). You could then use contentOffset.x to determine (or set) which page was being (or should be) displayed",
        "It could be considered as the coordinate of the origin of scrollView's frame relative to the origin of its contentView's frame. See the picture below:",
        "For example, if you wanted to present several (n) pages that could be scrolled through, you could create a UIScrollView with contentSize (n*pageWidth, pageHeight) and with frame size (pageWidth, pageHeight). You could then use contentOffset.x to determine (or set) which page was being (or should be) displayed",
        "It could be considered as the coordinate of the origin of scrollView's frame relative to the origin of its contentView's frame. See the picture below:",
        "For example, if you wanted to present several (n) pages that could be scrolled through, you could create a UIScrollView with contentSize (n*pageWidth, pageHeight) and with frame size (pageWidth, pageHeight). You could then use contentOffset.x to determine (or set) which page was being (or should be) displayed",
        "It could be considered as the coordinate of the origin of scrollView's frame relative to the origin of its contentView's frame. See the picture below:",
    ]
        
    override func viewDidLoad() {
           super.viewDidLoad()
    }
       
   override func didReceiveMemoryWarning() {
       super.didReceiveMemoryWarning()
   }
   
   // MARK: config
   override func setupUI() {
       super.setupUI()
       self.title = "Ex9"
        contentLabel.layer.borderWidth = 1
        contentLabel.layer.borderColor = UIColor.blue.cgColor
        numberImageLabel.text = "1/10"
        contentLabel.text = contentImage[0]
   }
   
   override func setupData() {
   }

    @IBAction func leftButtonTouchUpInside(_ sender: UIButton) {
         currentOffsetX = imageScroll.contentOffset.x
        if currentOffsetX != 0 {
            imageScroll.contentOffset.x -= imageScroll.bounds.width
        }
        numberImageLabel.text = "\(Int((imageScroll.contentOffset.x / imageScroll.bounds.width) + 1))/10"
        contentLabel.text = contentImage[Int(imageScroll.contentOffset.x / imageScroll.bounds.width)]
    }
    
    @IBAction func rightButtonTouchUpInside(_ sender: UIButton) {
        currentOffsetX = imageScroll.contentOffset.x
        if currentOffsetX != imageScroll.contentSize.width {
            imageScroll.contentOffset.x += imageScroll.bounds.width
        }
        numberImageLabel.text = "\(Int((imageScroll.contentOffset.x / imageScroll.bounds.width) + 1))/10"
        contentLabel.text = contentImage[Int(imageScroll.contentOffset.x / imageScroll.bounds.width)]
    }
}
