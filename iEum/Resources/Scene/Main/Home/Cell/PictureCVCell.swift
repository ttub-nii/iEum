//
//  PictureCVCell.swift
//  iEum
//
//  Created by 황수빈 on 16/07/2019.
//  Copyright © 2019 황수빈. All rights reserved.
//

import Foundation
import UIKit

class PictureCVCell: UICollectionViewCell {
    static let reuseIdentifier = "PictureCVCell"
    var workIdx: Int?
    @IBOutlet var workImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        workImg.layer.cornerRadius = 16
        workImg.layer.masksToBounds = true
        workImg.layer.shadowOffset = CGSize(width: 0, height: 0)
        workImg.layer.shadowRadius = 6
        workImg.layer.shadowOpacity = 0.16
    }
}
