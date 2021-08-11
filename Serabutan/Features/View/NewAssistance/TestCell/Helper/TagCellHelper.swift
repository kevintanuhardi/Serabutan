//
//  TagCellHelper.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 03/08/21.
//

import Foundation
import UIKit


public protocol CollectionCellAutoLayout: class {
    var cachedSize: CGSize? { get set }
}

public extension CollectionCellAutoLayout where Self: UICollectionViewCell {
 
    func preferredLayoutAttributes(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var newFrame = layoutAttributes.frame
        newFrame.size.width = CGFloat(ceilf(Float(size.width)))
        layoutAttributes.frame = newFrame
        cachedSize = newFrame.size
        return layoutAttributes
    }
}


