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
        return newAssistanceMediaImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = mediaImageCollectionView.dequeueReusableCell(withReuseIdentifier: ImageCarouselCVC.identifier, for: indexPath) as? ImageCarouselCVC else { fatalError("Table View Dequeue Error")}
        cell.imageView.image = newAssistanceMediaImage[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        self.newAssistanceMediaImage.remove(at: indexPath.row)
        //        self.mediaImageCollectionView.deleteItems(at: [indexPath])
        //        self.mediaImageCollectionView.reloadData()
    }
        
}
