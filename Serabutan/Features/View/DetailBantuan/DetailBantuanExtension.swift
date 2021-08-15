//
//  DetailBantuanExtension.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 12/08/21.
//

import UIKit
import TagListView

extension DetailBantuanVC {
    
    // MARK: - Collection View
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedJob?.medias?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = jobImgCarousel.dequeueReusableCell(withReuseIdentifier: ImageCarouselCVC.identifier,
                                                            for: indexPath) as? ImageCarouselCVC
        else {
            fatalError("DequeueReusableCell failed while casting.")
        }
        
        cell.imageView.image = selectedJob?.medias?[indexPath.row]
        return cell
    }
    
    // MARK: - Scroll View
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 {
            UIView.animate(withDuration: 0.2, animations: {
                self.floatingTopView.dropShadow(opacity: 0.25, offset: 5, scale: true)
            })
        } else {
            UIView.animate(withDuration: 0.2, animations: {
                self.floatingTopView.dropShadow(opacity: 0, offset: 0, scale: true)
            })
        }
    }
}
