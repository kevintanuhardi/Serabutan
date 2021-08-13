//
//  DetailBantuanCollectionView.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 12/08/21.
//

import Foundation
import UIKit
import TagListView

extension DetailBantuanVC {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedJob.medias?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = jobImgCarousel.dequeueReusableCell(withReuseIdentifier: ImageCarouselCVC.identifier, for: indexPath) as! ImageCarouselCVC
        cell.imageView.image = selectedJob.medias?[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            UIView.animate(withDuration: 0.2, animations: {
                self.floatingTopView.dropShadow(opacity: 0, offset: 0, scale: true)
            })
        } else if scrollView.contentOffset.y > 0 {
            UIView.animate(withDuration: 0.2, animations: {
                self.floatingTopView.dropShadow(opacity: 0.25, offset: 5, scale: true)
            })
        }
    }
    
    func tagPressed(_ title: String, tagView: TagView, sender: TagListView) {
//        let showAll = AssistanceListVC()
//        showAll.searchQuery = title
//        self.navigationController?.pushViewController(showAll, animated: true)
    }
}
