//
//  MypageViewController.swift
//  iEum
//
//  Created by 황수빈 on 16/07/2019.
//  Copyright © 2019 황수빈. All rights reserved.
//

import UIKit

class MypageViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var navigationBar: UINavigationBar!
    @IBOutlet var myTableView: UITableView!
    
    var cellList: [String] = ["스크랩한 글", "내가 쓴 글", "버젼"]
    var detailList: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarClear()
//        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//        navigationBar.shadowImage = UIImage()
//        navigationBar.isTranslucent = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.detailList = ["\(appDelegate.scrap)개", "\(appDelegate.my)개", "1.0"]
        myTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = cellList[indexPath.row]
        cell.detailTextLabel?.text = detailList[indexPath.row]
        return cell
    }
}
