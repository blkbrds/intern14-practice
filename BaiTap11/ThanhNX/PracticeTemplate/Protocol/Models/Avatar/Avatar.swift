//
//  Avatar.swift
//  Protocol
//
//  Created by PCI0008 on 8/12/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import Foundation

final class Avatar {
    var imageName: String
    var name: String
    
    init(imageName: String, name: String) {
        self.imageName = imageName
        self.name = name
    }
}

extension Avatar {
    struct Dummy {
        static let userData: [Avatar] = [Avatar(imageName: "ic-ava", name: "Thanh1"),
                                             Avatar(imageName: "ic-ava", name: "Thanh2"),
                                             Avatar(imageName: "ic-ava", name: "Thanh3"),
                                             Avatar(imageName: "ic-ava", name: "Thanh4"),
                                             Avatar(imageName: "ic-ava", name: "Thanh5"),
                                             Avatar(imageName: "ic-ava", name: "Thanh6"),
                                             Avatar(imageName: "ic-ava", name: "Thanh7"),
                                             Avatar(imageName: "ic-ava", name: "Thanh8"),
                                             Avatar(imageName: "ic-ava", name: "Thanh9"),
                                             Avatar(imageName: "ic-ava", name: "Thanh10"),
                                             Avatar(imageName: "ic-ava", name: "Thanh11"),
                                             Avatar(imageName: "ic-ava", name: "Thanh12"),
                                             Avatar(imageName: "ic-ava", name: "Thanh13"),
                                             Avatar(imageName: "ic-ava", name: "Thanh14"),
                                             Avatar(imageName: "ic-ava", name: "Thanh15"),
                                             Avatar(imageName: "ic-ava", name: "Thanh16"),
                                             Avatar(imageName: "ic-ava", name: "Thanh17"),
                                             Avatar(imageName: "ic-ava", name: "Thanh18"),
                                             Avatar(imageName: "ic-ava", name: "Thanh19"),
                                             Avatar(imageName: "ic-ava", name: "Thanh20"),
                                             Avatar(imageName: "ic-ava", name: "Thanh21"),
                                             Avatar(imageName: "ic-ava", name: "Thanh22"),
                                             Avatar(imageName: "ic-ava", name: "Thanh23"),
                                             Avatar(imageName: "ic-ava", name: "Thanh24"),
                                             Avatar(imageName: "ic-ava", name: "Thanh25"),
                                             Avatar(imageName: "ic-ava", name: "Thanh26"),
                                             Avatar(imageName: "ic-ava", name: "Thanh27"),
                                             Avatar(imageName: "ic-ava", name: "Thanh28"),
                                             Avatar(imageName: "ic-ava", name: "Thanh29"),
                                             Avatar(imageName: "ic-ava", name: "Thanh30"),
                                             Avatar(imageName: "ic-ava", name: "Thanh31"),
                                             Avatar(imageName: "ic-ava", name: "Thanh32"),
                                             Avatar(imageName: "ic-ava", name: "Thanh33")]
    }
}
