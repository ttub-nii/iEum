//
//  BannerCVCell.swift
//  iEum
//
//  Created by 황수빈 on 16/07/2019.
//  Copyright © 2019 황수빈. All rights reserved.
//

import UIKit
import CHIPageControl

class BannerCVCell: UICollectionViewCell {
    static let reuseIdentifier = "BannerCVCell"
    @IBOutlet var bannerCV: UICollectionView!
    @IBOutlet var pageControl: CHIPageControlAleppo!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bannerCV.delegate = self
        bannerCV.dataSource = self
    }
}

extension BannerCVCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appDelegate.bannerList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerDetailCVCell.reuseIdentifier, for: indexPath) as! BannerDetailCVCell
        
        let banner = appDelegate.bannerList[indexPath.row]
        cell.bannerImg?.image = banner.bannerImg
        
        return cell
    }
}

extension BannerCVCell: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        let w = scrollView.bounds.size.width
        let currentPage = Int(ceil(x/w))
        print(currentPage)
        pageControl.set(progress: currentPage, animated: true)
    }
}
