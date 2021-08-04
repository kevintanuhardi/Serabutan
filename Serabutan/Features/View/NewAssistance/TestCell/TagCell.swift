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
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var tagLabel: UILabel!
    
    static let identifier  = "TagCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "TagCell", bundle: nil)
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        return preferredLayoutAttributes(layoutAttributes)
    }
    
    func configTagCell(){
        mainView.layer.masksToBounds = true
        mainView.layer.cornerRadius = 5
        mainView.layer.borderWidth = 0.25
        mainView.layer.borderColor = UIColor.init(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00).cgColor
    }
   
}


