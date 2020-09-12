//
//  iEumVC.swift
//  iEum
//
//  Created by 황수빈 on 17/07/2019.
//  Copyright © 2019 황수빈. All rights reserved.
//

import UIKit
import SwiftGifOrigin
import SwiftOverlayShims

class iEumVC: UIViewController {

    @IBOutlet var splashImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showGif()
    }
    
    func showGif() {
        self.splashImg.image = UIImage.gif(name: "ieum")
        
        do {
            let imageData = try Data(contentsOf: Bundle.main.url(forResource: "ieum", withExtension: "gif")!)
            self.splashImg.image = UIImage.gif(data: imageData)
            
        } catch {
            print(error)
        }
        
        perform(#selector(iEumVC.showTutorial), with: nil, afterDelay: 3)
    }
    
    // 토큰이 있는 경우와 없는 경우에 따라 분기처리.
    @objc func showTutorial() {
            // 토큰이 없는 경우 튜토리얼로 이동
            let storyboard = UIStoryboard.init(name: "Login", bundle: nil)
            let login = storyboard.instantiateViewController(withIdentifier: "LoginVC")
            present(login, animated: true)
    }
}
