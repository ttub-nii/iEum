//
//  TutorialViewController.swift
//  iEum
//
//  Created by 황수빈 on 17/07/2019.
//  Copyright © 2019 황수빈. All rights reserved.
//

import UIKit
import SwiftGifOrigin
import SwiftOverlayShims

class TutorialViewController: UIViewController {
    
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
        perform(#selector(TutorialViewController.showTutorial), with: nil, afterDelay: 3)
    }
    
    @objc func showTutorial() {
        let storyboard = UIStoryboard.init(name: "Login", bundle: .main)
        let login = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
        login.modalPresentationStyle = .fullScreen
        present(login, animated: true)
    }
}
