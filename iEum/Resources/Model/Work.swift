//
//  Work.swift
//  iEum
//
//  Created by 황수빈 on 16/07/2019.
//  Copyright © 2019 황수빈. All rights reserved.
//

import Foundation
import UIKit

struct Work {
    var workIdx: Int?
    var workMainImg: UIImage?
    var workSubImg: UIImage?
    var title: String
    var subTitle: String
    var detailList: [Detail] = []
    
    init(workIdx: Int, title: String, subTitle: String, workName: String, subName: String) {
        self.workIdx = workIdx
        self.title = title
        self.subTitle = subTitle
        self.workMainImg = UIImage(named: workName)
        self.workSubImg = UIImage(named: subName)
    }
}
