//
//  ParentView.swift
//  AutoLayouts
//
//  Created by MBA0051 on 10/15/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

/**
 * Create parent UIView.
 * Solution has been support by Vinh Ho X.
 */
class ParentView: UIView {

    var isViewLoadNib = false

    override func awakeFromNib() {
        super.awakeFromNib()
        loadNib()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func loadNib() {

        let bundle = Bundle.main
        var xib: String?
        let name = String(describing: type(of: self))
        if bundle.path(forResource: name, ofType: "xib") != nil {
            xib = name
        }
        if let xib = xib, let view = bundle.loadNibNamed(xib, owner: self)?.first as? UIView {
            addSubview(view)
            view.frame = bounds
        }
        isViewLoadNib = true
    }
}

extension Bundle {
    func hasNib(name: String) -> Bool {
        return path(forResource: name, ofType: "nib") != nil
    }
}

