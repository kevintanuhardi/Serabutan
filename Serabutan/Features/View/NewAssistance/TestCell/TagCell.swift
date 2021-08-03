//
//  TagCell.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 03/08/21.
//

import UIKit

class TagCell: UICollectionViewCell, CollectionCellAutoLayout{
    
    var cachedSize: CGSize?
    
    var collectionViewFlowLayout = UICollectionViewFlowLayout()
    
    @IBOutlet weak var tagLabel: UILabel!
    
    static let identifier  = "TagCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "TagCell", bundle: nil)
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        return preferredLayoutAttributes(layoutAttributes)
    }
    
   
    }


