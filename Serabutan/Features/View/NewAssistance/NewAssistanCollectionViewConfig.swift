//
//  NewAssistanCollectionViewConfig.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 30/07/21.
//

import Foundation
import UIKit

extension NewAssistanceVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //            return newAssistanceMediaImage.count
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = jobImgCarousel.dequeueReusableCell(withReuseIdentifier: ImageCarouselCVC.identifier, for: indexPath) as! ImageCarouselCVC
//        cell.configure(with: UIImage(newAssistanceMediaImage)!)
//        return cell
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        self.newAssistanceMediaImage.remove(at: indexPath.row)
        //        self.mediaImageCollectionView.deleteItems(at: [indexPath])
        //        self.mediaImageCollectionView.reloadData()
        //        print("IMPORTED IMAGE:", newAssistanceMediaImage)
    }
        
}
