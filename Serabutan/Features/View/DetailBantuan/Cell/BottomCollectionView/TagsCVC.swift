//
//  TagsCVC.swift
//  Serabutan
//
//  Created by Gilang Adrian on 03/08/21.
//

import UIKit

class TagsCVC: UICollectionViewCell {
    
    static let identifier = "TagsCVC"
    
    @IBOutlet weak var tagsLabel: UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: "TagsCVC", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.ColorLibrary.mediumGrey.cgColor
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
        tagsLabel.font = .FontLibrary.body
        tagsLabel.textColor = .ColorLibrary.customBlack
    }
}
