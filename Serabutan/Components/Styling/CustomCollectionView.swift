//
//  CustomCollectionView.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 05/08/21.
//

import Foundation
import UIKit

class CustomCollectionView: UICollectionViewFlowLayout {
    let spacing = CGFloat(0.0) // spacing between views
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let oldAttributes = super.layoutAttributesForElements(in: rect) else {
            return super.layoutAttributesForElements(in: rect)
        }
        
        var newAttributes = [UICollectionViewLayoutAttributes]()
        var leftMargin = self.sectionInset.left
        for attributes in oldAttributes {
            if (attributes.frame.origin.x == self.sectionInset.left) {
                leftMargin = self.sectionInset.left
            } else {
                var newLeftAlignedFrame = attributes.frame
                newLeftAlignedFrame.origin.x = leftMargin
                attributes.frame = newLeftAlignedFrame
            }
            
            leftMargin += attributes.frame.width + spacing
            newAttributes.append(attributes)
        }
        return newAttributes
    }
}
