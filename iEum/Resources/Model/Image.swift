//
//  Image.swift
//  iEum
//
//  Created by 황수빈 on 22/07/2019.
//  Copyright © 2019 황수빈. All rights reserved.
//

import Foundation
import UIKit

struct Image {
    let selectImg: UIImage?
    
    init(selectName: String) {
        self.selectImg = UIImage(named: selectName)
    }
}
