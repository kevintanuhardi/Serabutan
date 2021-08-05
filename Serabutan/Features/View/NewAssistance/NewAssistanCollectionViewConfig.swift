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
        
        //        if(collectionView == infoCollectionView){
        return 0
        //        } else if (collectionView == mediaImageCollectionView){
        //            return newAssistanceMediaImage.count
        //        }
        //        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //        if(collectionView == infoCollectionView){
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCell.identifier, for: indexPath) as! TagCell
//        cell.tagLabel.text = newAssistanceInfo[indexPath.row].name
//        print(cell.tagLabel.text!)
//        cell.configTagCell()
//        return cell
        //        } else if (collectionView == mediaImageCollectionView) {
        //            let cell = jobImgCarousel.dequeueReusableCell(withReuseIdentifier: ImageCarouselCVC.identifier, for: indexPath) as! ImageCarouselCVC
        //            cell.configure(with: UIImage(newAssistanceMediaImage)!)
        //            return cell
        //        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.newAssistanceInfo.remove(at: indexPath.row)
        self.infoCollectionView.deleteItems(at: [indexPath])
        self.infoCollectionView.reloadData()
        print(newAssistanceInfo)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView.numberOfItems(inSection: section) == 1 {
            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: collectionView.frame.width - flowLayout.itemSize.width)
        }
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        infoCollectionView.frame = view.bounds
//        
//    }
    
    
}
