//
//  Detail.swift
//  iEum
//
//  Created by 황수빈 on 17/07/2019.
//  Copyright © 2019 황수빈. All rights reserved.
//

import Foundation
import UIKit

struct Detail {
    let workIdx: Int
    let explanation: String?
    let posterImg: UIImage?
    
    init(workIdx:Int, explanation:String, workName: String) {
        self.workIdx = workIdx
        self.explanation = explanation
        self.posterImg = UIImage(named: workName)
    }
}
