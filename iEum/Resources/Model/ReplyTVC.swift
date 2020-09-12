//
//  ReplyTVC.swift
//  iEum
//
//  Created by 황수빈 on 18/07/2019.
//  Copyright © 2019 황수빈. All rights reserved.
//

import UIKit

class ReplyTVC: UITableViewCell {

    @IBOutlet var profile: UIImageView?
    @IBOutlet var nickname: UILabel?
    @IBOutlet var reply: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.nickname?.sizeToFit()
        self.reply?.sizeToFit()
    }
}
