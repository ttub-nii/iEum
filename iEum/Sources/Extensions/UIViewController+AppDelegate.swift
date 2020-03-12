//
//  UIViewController+AppDelegate.swift
//  iEum
//
//  Created by 황수빈 on 22/07/2019.
//  Copyright © 2019 황수빈. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
}
