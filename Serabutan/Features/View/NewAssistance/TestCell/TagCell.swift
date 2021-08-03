//
//  TagCell.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 03/08/21.
//

import UIKit

class TagCell: UICollectionViewCell {

    @IBOutlet weak var tagLabel: UILabel!
    
    static let identifier  = "TagCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "TagCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
