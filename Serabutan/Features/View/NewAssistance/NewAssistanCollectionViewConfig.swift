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
        return tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCell.identifier, for: indexPath) as! TagCell
            cell.tagLabel.text = tags[indexPath.row].name
//            cell.layer.borderWidth = Constants.borderWidth
//            cell.layer.borderColor = UIColor.lightGray.cgColor
//            cell.maxWidth = collectionView.bounds.width - Constants.spacing
            print(cell.tagLabel.text!)
            
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        if collectionView.numberOfItems(inSection: section) == 1 {

             let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: collectionView.frame.width - flowLayout.itemSize.width)

        }

        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

    }
//    
//    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
//        return preferredLayoutAttributes(layoutAttributes)
//    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        infoCollectionView.frame = view.bounds
        
    }
    
   
}
