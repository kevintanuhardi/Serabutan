//
//  NewAssistanCollectionViewConfig.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 30/07/21.
//

import Foundation
import UIKit

extension NewAssistanceVC {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCell.identifier, for: indexPath) as! TagCell
        
        if collectionView == infoCollectionView{
            cell.tagLabel.text = tags[indexPath.row].name
            print(infoCollectionView.frame)

        }
        return cell
    }
    
}
