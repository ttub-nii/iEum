//
//  MainViewController.swift
//  iEum
//
//  Created by 황수빈 on 16/07/2019.
//  Copyright © 2019 황수빈. All rights reserved.
//

import UIKit
import Hero
import CHIPageControl

class MainViewController: UIViewController {

    @IBOutlet var bannerCV: UICollectionView!
    @IBOutlet var workCV: UICollectionView!
    
    // IbOutlet 추가
    @IBOutlet var paging: CHIPageControlAleppo!
    @IBOutlet var filter: UIView!
    @IBOutlet var round: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setNavigationBarTitle()
        setBanner()
        
        bannerCV.delegate = self
        bannerCV.dataSource = self
        
        workCV.delegate = self
        workCV.dataSource = self
        
        //set progress with animation
        
        bannerCV.isPagingEnabled = true
        // print("asdfsdfdf",self.paging.currentPage)
        //self.paging.set(progress: 2, animated: true)
        
        filter.layer.cornerRadius = 5
        let yourColor = UIColor(red: 195.0/255, green: 195.0/255, blue: 195.0/255, alpha: 1.0)
        filter.layer.borderWidth = 1.0
        filter.layer.borderColor = yourColor.cgColor
        filter.layer.masksToBounds = true
        
        round.layer.cornerRadius = 6
        filter.layer.masksToBounds = true
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 데이타 셋팅
       workCV.reloadData()
    }
    
    func setNavigationBarTitle() {
        let image = UIImage(named: "logoImg")
        navigationItem.titleView = UIImageView(image: image)
    }
}

// UICollectionViewDataSource 를 채택합니다.
extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if collectionView == self.workCV {
//            return appDelegate.workList.count
//        }
        return appDelegate.bannerList.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       if collectionView == self.workCV {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WorkCell", for: indexPath) as! WorkCell

            let work = appDelegate.workList[indexPath.row]

            cell.workIdx = work.workIdx
            cell.workImg.image = work.workMainImg

           return cell
        }
        else {
            let bannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! BannerCell
            
            let banner = appDelegate.bannerList[indexPath.row]
            bannerCell.banner?.image = banner.bannerImg
            
            // bannerCell.banner = bannerList.
            return bannerCell
        }
    }
}

// UICollectionViewDelegate 를 채택합니다.
extension MainViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let dvc = storyboard?.instantiateViewController(withIdentifier: "SubViewController") as! SubViewController
        
        let work = appDelegate.workList[indexPath.row]
        
        dvc.workIdx = work.workIdx
        dvc.workImg = work.workSubImg
        dvc.headTitle = work.title
        dvc.subTitle = work.subTitle
        
        present(dvc, animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        let w = scrollView.bounds.size.width
        let currentPage = Int(ceil(x/w))
        print(currentPage)
        self.paging.set(progress: currentPage, animated: true)
    }
}

extension MainViewController{
    func setBanner() {
        let banner1 = Banner(bannerName: "mainImage")
        let banner2 = Banner(bannerName: "mainImage01")
        let banner3 = Banner(bannerName: "mainImage02")
        
        appDelegate.bannerList = [banner1, banner2, banner3]
    }
}
