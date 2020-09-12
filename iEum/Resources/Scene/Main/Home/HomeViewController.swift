//
//  MainViewController.swift
//  iEum
//
//  Created by 황수빈 on 16/07/2019.
//  Copyright © 2019 황수빈. All rights reserved.
//

import UIKit

enum Section: Int {
    case banner = 0, picture
}

class HomeViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    let sections = [Section.banner, Section.picture]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarTitle()
        setBanner()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setNavigationBarTitle() {
        let image = UIImage(named: "logoImg")
        navigationItem.titleView = UIImageView(image: image)
    }
    
    func setBanner() {
        let banner1 = Banner(bannerName: "mainImage")
        let banner2 = Banner(bannerName: "mainImage01")
        let banner3 = Banner(bannerName: "mainImage02")
        
        appDelegate.bannerList = [banner1, banner2, banner3]
    }
}

extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let cellType = sections[section]
        
        switch cellType {
        case .banner:
            return 1
        default:
            return appDelegate.workList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellType = sections[indexPath.section]
        
        switch cellType {
        case .banner:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCVCell.reuseIdentifier, for: indexPath) as! BannerCVCell
            return cell
        case .picture:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PictureCVCell.reuseIdentifier, for: indexPath) as! PictureCVCell
            let work = appDelegate.workList[indexPath.row]
            cell.workIdx = work.workIdx
            cell.workImg.image = work.workMainImg
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch  kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "FilterView", for: indexPath)
            return headerView
        default:
            return .init()
        }
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            let storyboard = UIStoryboard.init(name: "Main", bundle: .main)
            let dvc = storyboard.instantiateViewController(withIdentifier: "SubViewController") as! SubViewController
            let work = appDelegate.workList[indexPath.row]
            
            dvc.workIdx = work.workIdx
            dvc.workImg = work.workSubImg
            dvc.headTitle = work.title
            dvc.subTitle = work.subTitle
            
            self.navigationController?.pushViewController(dvc, animated: true)
        } else {
            return
        }
    }
}
