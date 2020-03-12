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
        // Initialization code
        self.nickname?.sizeToFit()
        self.reply?.sizeToFit()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
