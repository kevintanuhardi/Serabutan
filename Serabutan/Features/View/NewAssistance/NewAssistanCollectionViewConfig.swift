//
//  NewAssistanCollectionViewConfig.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 30/07/21.
//

import Foundation
import UIKit

extension NewAssistanceVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == infoCollectionView{
            return currTags.count
        } else {
            return currMediaImage.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if collectionView == infoCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCollectionViewCell.identifier, for: indexPath) as! TagCollectionViewCell
            cell.tagLabel.text = currTags[indexPath.row].name
            return cell
//        } else {
//           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MediaImageCollectionViewCell.identifier, for: indexPath) as! MediaImageCollectionViewCell
//        cell.tagLabel.text = currTags[indexPath.row]
//        return cell
//        }
    }

}
